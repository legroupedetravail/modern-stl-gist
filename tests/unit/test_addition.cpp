#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(AdditionTests)

BOOST_AUTO_TEST_CASE(Addition)
{
    BOOST_TEST_CHECK(1 + 1 == 2);
}

BOOST_AUTO_TEST_SUITE_END()