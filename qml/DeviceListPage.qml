import QtQuick 2.4
import QtQuick.Controls 1.4

import "delegates"

Item {

	ListModel {
		id: broadcastClientList
		property bool progressVisible : false
	}

	ListView {
		id: broadcastClientView
		anchors.fill: parent
		model: broadcastClientList
		delegate: DeviceDelegate {
			width: parent.width
			height: 128
			//iconOpacity: emitterListView.currentIndex === index ? 1.0 : 0.25
			color: broadcastClientView.currentIndex === index ? sg : bg
			opacity: 1.0

			MouseArea {
				anchors.fill: parent
				onClicked: {
					webSocket.url = ""
					broadcastClientView.currentIndex = index;
					var address = "ws://"
					address = address.concat(host, ":", port);
					webSocket.url = address
					configuration.device = device
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
	}

}
