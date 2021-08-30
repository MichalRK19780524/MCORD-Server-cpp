find_package(Qt5 COMPONENTS Core Widgets REQUIRED)

add_subdirectory(network)

include_directories(${Qt5Widgets_INCLUDES})
add_definitions(${Qt5Widgets_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")

add_executable(MCORD-Server main.cpp)
include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
  set_target_properties(MCORD-Server PROPERTIES INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()

target_link_libraries(MCORD-Server
    Qt5::Widgets
    Qt5::Core
    )

