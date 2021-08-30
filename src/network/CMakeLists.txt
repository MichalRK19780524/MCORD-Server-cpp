add_library(network "")

target_sources(network
  PRIVATE
    hub_tcp_connection.cpp
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/hub_tcp_connection.hpp
  )

target_include_directories(network
  PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
  )
