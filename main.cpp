#include <iostream>

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QSplashScreen>

#include <core/networking/broadcast-monitor.h>

int main(int argc, char *argv[]) {
	QGuiApplication::setApplicationName("LedFrameMobile");
	QGuiApplication::setOrganizationName("LedFrameMobile");
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QApplication application(argc, argv);

	QSplashScreen splash({":/splash/splash.png"});
	splash.show();
	application.processEvents();

	QQmlApplicationEngine engine;
	Network::BroadcastMonitor monitor;
	engine.rootContext()->setContextProperty("broadcast", &monitor);
	QQmlComponent component(&engine, QUrl("qrc:/main.qml"));
	QObject *rootObject = component.create();

	if (!rootObject) {
		std::cout << component.errorString().toStdString() << std::endl;
		return 1;
	}

	splash.hide();
	return application.exec();
}
