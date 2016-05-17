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
		delegate: DeviceItem {}

		add: Transition {
			NumberAnimation { properties: "x,y"; from: 0; duration: 100 }
		}

		function reset() {
			if (count > 0) {
				for (var i = 0; i < count; ++i)
				{
					model.get(i).progressVisible = false;
				}
			}
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
		console.log(arg)
	}



}
