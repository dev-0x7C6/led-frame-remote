#include <iostream>

#include <QApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlComponent>
#include <QtQml/QQmlContext>

#include <core/networking/broadcast-monitor.h>

int main(int argc, char *argv[]) {
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication application(argc, argv);
	QGuiApplication::setApplicationName("LedFrameMobile");
	QGuiApplication::setOrganizationName("LedFrameMobile");
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QQmlApplicationEngine engine;
	Network::BroadcastMonitor monitor;
	engine.rootContext()->setContextProperty("broadcast", &monitor);
	QQmlComponent component(&engine, QUrl("qrc:/main.qml"));
	QObject *rootObject = component.create();

	if (!rootObject) {
		std::cout << component.errorString().toStdString() << std::endl;
		return 1;
	}

	return QGuiApplication::exec();
}
