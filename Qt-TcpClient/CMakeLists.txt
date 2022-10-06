cmake_minimum_required(VERSION 3.10.0)

project(tcpClient)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5 CONFIG REQUIRED COMPONENTS Widgets Core Quick Network)

add_executable(tcpClient
    main.cpp
    tcpclient.cpp
    qml.qrc
    )

target_link_libraries(tcpClient
    Qt5::Widgets
    Qt5::Core
    Qt5::Quick
    Qt5::Network)
