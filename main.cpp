#include <iostream>

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>

#include <core/networking/broadcast-monitor.h>

int main(int argc, char *argv[]) {
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication application(argc, argv);
	application.setApplicationName("LedFrameMobile");
	application.setOrganizationName("LedFrameMobile");
	application.setAttribute(Qt::AA_EnableHighDpiScaling);

	QQmlApplicationEngine engine;
	Network::BroadcastMonitor monitor;
	engine.rootContext()->setContextProperty("broadcast", &monitor);
	QQmlComponent component(&engine, QUrl("qrc:/main.qml"));
	QObject *rootObject = component.create();

	if (!rootObject) {
		std::cout << component.errorString().toStdString() << std::endl;
		return 1;
	}

	return application.exec();
}
