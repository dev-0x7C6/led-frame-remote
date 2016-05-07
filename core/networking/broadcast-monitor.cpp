#include <core/networking/broadcast-monitor.h>

#include <QJsonDocument>
#include <QUdpSocket>

using namespace Network;

BroadcastMonitor::BroadcastMonitor(QObject *parent)
	: QObject(parent)
	, m_socket(new QUdpSocket(this))

{
	m_socket->bind(45454, QUdpSocket::ShareAddress);
	connect(m_socket, &QUdpSocket::readyRead, this, &BroadcastMonitor::readPendingDatagrams);
}

void BroadcastMonitor::readPendingDatagrams() {
	while (m_socket->hasPendingDatagrams()) {
		QByteArray datagram;
		datagram.resize(static_cast<int>(m_socket->pendingDatagramSize()));
		m_socket->readDatagram(datagram.data(), datagram.size());
		auto document = QJsonDocument::fromJson(datagram);
		emit signalDeviceAvailable(document.toVariant());
		qDebug() << datagram;
	}
}
