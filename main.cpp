#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

#include <core/networking/broadcast-monitor.h>

int main(int argc, char *argv[])
{
	QGuiApplication::setApplicationName("LedFrame Remote");
	QGuiApplication::setOrganizationName("LedFrame");
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QApplication app(argc, argv);

	qputenv("QT_LABS_CONTROLS_STYLE", "flat");

	Network::BroadcastMonitor monitor;


	QQmlApplicationEngine engine;
	QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/main.qml")));
	QObject *qml = component.create();


	QObject::connect(&monitor, &Network::BroadcastMonitor::signalDeviceAvailable, [qml](){
		QVariant returnedValue;
		QMetaObject::invokeMethod(qml, "deviceConnected",
				  Q_RETURN_ARG(QVariant, returnedValue));
	});

	return app.exec();
}
