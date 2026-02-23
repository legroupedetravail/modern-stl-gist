find_package(boost_unit_test_framework CONFIG REQUIRED)

add_executable(${PROJECT_NAME}-tests    
    "main.cpp" 
    "test_addition.cpp"
)

target_link_libraries(${PROJECT_NAME}-tests
    PRIVATE
        Boost::unit_test_framework
)

add_test(NAME 
        ModernCppTests
    COMMAND 
        ${PROJECT_NAME}-tests --log_level=test_suite
)