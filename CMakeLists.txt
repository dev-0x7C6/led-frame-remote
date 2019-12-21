cmake_minimum_required(VERSION 3.12)

project(led-frame-mobile LANGUAGES CXX)

set(CXX_STANDARD_REQUIRED 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# Requirements for Android
# >= Android SDK 22
# = Android NDK 20.0
# >= Qt 5.14.0
# >= QtCreator 4.11.0

if(ANDROID)
    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
endif()

find_package(Qt5 COMPONENTS Core Gui Widgets Qml Quick QuickControls2 Network REQUIRED)

set(sources
    "main.cpp"
    "qml/qml.qrc"
    "resources/resources.qrc"
    "core/networking/broadcast-monitor.cpp"
    "core/networking/broadcast-monitor.h"
)

if(ANDROID)
    add_library(${PROJECT_NAME} SHARED ${sources})
else()
    add_executable(${PROJECT_NAME} ${sources})
endif()

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Widgets Qt5::Network Qt5::Qml Qt5::Quick)
