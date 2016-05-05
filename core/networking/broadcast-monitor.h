#pragma once

#include <QObject>

class QUdpSocket;

namespace Network {

	class BroadcastMonitor final : public QObject {
		Q_OBJECT
	public:
		explicit BroadcastMonitor(QObject *parent = nullptr);
		virtual ~BroadcastMonitor() = default;

	protected:
		void readPendingDatagrams();

	private:
		QUdpSocket *m_socket;

	signals:
		void signalDeviceAvailable();
	};

}
