cmake_minimum_required(VERSION 3.2)

project(led-frame-mobile LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Gui Widgets Qml Quick QuickControls2 Network REQUIRED)

add_executable(${PROJECT_NAME} "main.cpp" "qml/qml.qrc" "resources/resources.qrc" "core/networking/broadcast-monitor.cpp" "core/networking/broadcast-monitor.h")

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Widgets Qt5::Network Qt5::Qml Qt5::Quick)
