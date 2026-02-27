/**
 *
 * modern-stl-gist
 *
 * CEA CNRS INRIA LOGICIEL LIBRE
 *
 * Copyright(c) 2026 legroupedetravail
 *
 * This software is a computer program whose purpose is to provide
 * minimalist modern C++ functionalities for cross-platform development.
 *
 * This software is governed by the CeCILL license under French law and
 * abiding by the rules of distribution of free software.  You can  use,
 * modify and/ or redistribute the software under the terms of the CeCILL
 * license as circulated by CEA, CNRS and INRIA at the following URL
 * "http://www.cecill.info".
 *
 * As a counterpart to the access to the source code and  rights to copy,
 * modify and redistribute granted by the license, users are provided only
 * with a limited warranty  and the software's author,  the holder of the
 * economic rights,  and the successive licensors  have only  limited
 * liability.
 *
 * In this respect, the user's attention is drawn to the risks associated
 * with loading,  using,  modifying and/or developing or reproducing the
 * software by the user in light of its specific status of free software,
 * that may mean  that it is complicated to manipulate,  and  that  also
 * therefore means  that it is reserved for developers  and  experienced
 * professionals having in-depth computer knowledge. Users are therefore
 * encouraged to load and test the software's suitability as regards their
 * requirements in conditions enabling the security of their systems and/or
 * data to be ensured and,  more generally, to use and operate it in the
 * same conditions as regards security.
 *
 * The fact that you are presently reading this means that you have had
 * knowledge of the CeCILL license and that you accept its terms.
 *
 */

#include "pch.h"
#include "worker_thread.h"

worker_thread::worker_thread()
    : m_event_action_1_requested(false)
    , m_event_action_2_requested(false)
{
}

void worker_thread::start()
{
    if (m_thread.joinable())
    {
        m_thread.request_stop();
        m_thread.join();
    }

    {
        std::lock_guard<std::mutex> lock(m_mutex);
        m_event_action_1_requested = false;
        m_event_action_2_requested = false;
    }

    m_thread = std::jthread([this](std::stop_token stoken)
    {
        this->thread_proc(stoken);
    });
}

void worker_thread::stop()
{
    m_thread.request_stop();
    m_condition_variable.notify_one();
    m_thread.join();
}

void worker_thread::request_event_action_1()
{
    {
        std::lock_guard<std::mutex> lock(m_mutex);
        m_event_action_1_requested = true;
    }

    m_condition_variable.notify_one();
}

void worker_thread::request_event_action_2()
{
    {
        std::lock_guard<std::mutex> lock(m_mutex);
        m_event_action_2_requested = true;
    }

    m_condition_variable.notify_one();
}

void worker_thread::on_event_action_1()
{
    std::cout << "Export some data to zip file" << std::endl;
}

void worker_thread::on_event_action_2()
{
    std::cout << "Send some data to PLC" << std::endl;
}

void worker_thread::on_cyclic_action_1()
{
    std::cout << "Purge oldest data" << std::endl;
}

void worker_thread::thread_proc(std::stop_token stoken)
{
    using namespace std::literals::chrono_literals;

    while (!stoken.stop_requested())
    {
        auto do_action_1  = false;
        auto do_action_2  = false;
        auto wait_timeout = false;

        {
            std::unique_lock<std::mutex> lock(m_mutex);

            wait_timeout = !m_condition_variable.wait_for(lock, 1s, [&stoken, this]
            {
                return stoken.stop_requested() || m_event_action_1_requested || m_event_action_2_requested;
            });

            if (stoken.stop_requested())
            {
                break;
            }

            do_action_1 = std::exchange(m_event_action_1_requested, false);
            do_action_2 = std::exchange(m_event_action_2_requested, false);
        }

        if (do_action_1)
        {
            on_event_action_1();
        }

        if (do_action_2)
        {
            on_event_action_2();
        }

        if (wait_timeout)
        {
            on_cyclic_action_1();
        }
    }
}