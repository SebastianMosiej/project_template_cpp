cmake_policy(SET CMP0020 NEW )

find_package(Qt5Widgets)
find_package(Qt5Core)
find_package(Qt5Test)

set(ENV{QTEST_COLORED} 1)

#boost build with bjam threading=multi runtime-link=static
#bjam link=static,shared threading=single,multi
SET(Boost_USE_MULTITHREADED ON)
SET(Boost_USE_STATIC_LIBS ON)
#SET(Boost_USE_STATIC_RUNTIME OFF)
SET(WITH_UNIT_TESTS OFF)
#find_package(Boost REQUIRED COMPONENTS date_time system filesystem unit_test_framework) #thread system date_time chrono)

if (MSVC)
  set ( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} /MP")
  #SET(CMAKE_CXX_FLAGS "/WL /MP /GR /EHsc" )
   message(STATUS "Added parallel build arguments to CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")
endif()

if (UNIX)
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()
