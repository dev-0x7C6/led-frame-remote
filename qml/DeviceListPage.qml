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
		//clip: true
		model: broadcastClientList
		delegate: DeviceItem {}
	}

	function count() {
		return broadcastClientList.count();
	}

	function insert(arg) {
		broadcastClientList.append(arg);
		console.log(arg)
	}

}
