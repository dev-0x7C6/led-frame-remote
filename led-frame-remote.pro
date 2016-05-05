TEMPLATE = app

QT += qml quick widgets

CONFIG += c++14

SOURCES += main.cpp \
    core/networking/broadcast-monitor.cpp

RESOURCES += qml/qml.qrc \
    resources/resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    core/networking/broadcast-monitor.h
