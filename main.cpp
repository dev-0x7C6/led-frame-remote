#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QSettings>

#include <core/networking/broadcast-monitor.h>

int main(int argc, char *argv[]) {
	QGuiApplication::setApplicationName("LedFrame Remote");
	QGuiApplication::setOrganizationName("LedFrame");
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QApplication app(argc, argv);
	QSettings settings;
	qputenv("QT_LABS_CONTROLS_STYLE", settings.value("style").toByteArray());
	Network::BroadcastMonitor monitor;
	QQmlApplicationEngine engine;
	QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/main.qml")));
	QObject *rootObject = component.create();

	if (!rootObject)
		return 1;

	QObject::connect(&monitor, &Network::BroadcastMonitor::signalDeviceAvailable, [rootObject](const QVariant & arg) {
		QVariant returnedValue;
		QMetaObject::invokeMethod(rootObject, "broadcastClientAdded",
		                          Q_RETURN_ARG(QVariant, returnedValue), Q_ARG(QVariant, arg));
	});
	return app.exec();
}
