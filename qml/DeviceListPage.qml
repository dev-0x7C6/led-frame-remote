import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {

	ListModel {
		id: broadcastClientList
	}

	ListView {
		id: broadcastClientView
		anchors.fill: parent
		clip: true
		model: broadcastClientList
		delegate: DeviceItem {}
	}

	function insert(arg) {
		broadcastClientList.insert(0, arg);
	}

}
