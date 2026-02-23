cmake_minimum_required(VERSION 3.31.6)
cmake_policy(SET CMP0167 NEW)

set(PROJECT_NAME modern-stl-gist)
set(PROJECT_PRETTY_NAME "Gists of Modern C++ STL")
set(PROJECT_VENDOR "Aloatec")
set(PROJECT_DESCRIPTION "Modern CMake-based C++ Template")
set(PROJECT_VERSION "1.0.0")
set(PROJECT_HOMEPAGE_URL "https://github.com/legroupedetravail/modern-stl-gist")
set(PROJECT_MAINTENER "legroupedetravail")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
	include(cmake/windows.cmake)    
else()
	include(cmake/unix.cmake)
endif()

include(cmake/uncrustify.cmake)
include(cmake/cppcheck.cmake)
include(cmake/clear.cmake)

project(${PROJECT_NAME} 
	LANGUAGES CXX
	DESCRIPTION ${PROJECT_DESCRIPTION}
	VERSION ${PROJECT_VERSION}
)

add_subdirectory(examples)