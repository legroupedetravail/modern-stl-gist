cmake_minimum_required(VERSION 3.31.6)
cmake_policy(SET CMP0167 NEW)

set(PROJECT_NAME modern-cpp-template)
set(PROJECT_PRETTY_NAME "Modern C++ Template")
set(PROJECT_VENDOR "Aloatec")
set(PROJECT_DESCRIPTION "Modern CMake-based C++ Template")
set(PROJECT_VERSION "1.0.0")
set(PROJECT_HOMEPAGE_URL "https://github.com/OliveiraDF/modern-cpp-template")
set(PROJECT_MAINTENER "OliveiraDF (ochoquet@laposte.net)")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

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

enable_testing()

add_subdirectory(src)
add_subdirectory(tests)

install(TARGETS ${PROJECT_NAME}-app
    RUNTIME DESTINATION bin
)

include(cmake/package.cmake)