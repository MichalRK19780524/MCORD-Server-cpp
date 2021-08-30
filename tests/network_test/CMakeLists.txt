add_executable(cpp_test test.cpp)
target_link_libraries(cpp_test network GTest::gtest GTest::gtest_main)
target_include_directories(cpp_test PRIVATE network)

include(GoogleTest)
gtest_discover_tests(cpp_test)

add_test(
  NAME
    test_network
  COMMAND
    $<TARGET_FILE:cpp_test>
  )
