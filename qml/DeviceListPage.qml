import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {

	ListModel {
		id: broadcastClientList
		property bool progressVisible : false
	}

	ListView {
		id: broadcastClientView
		anchors.fill: parent
		model: broadcastClientList
		delegate: DeviceItem {
			width: parent.width
			height: 128
		}
	}

	function reset() {
		broadcastClientView.reset()
	}

	function count() {
		return broadcastClientList.count()
	}

	function insert(arg) {
		broadcastClientList.append(arg)
	}

}
