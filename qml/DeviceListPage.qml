import QtQuick 2.4
import QtQuick.Controls 2.0

import "delegates"

Item {
	ListView {
		id: broadcastClientView
		anchors.fill: parent
		model: broadcastClientList
		delegate: DeviceDelegate {
			width: parent.width
			height: 96
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
					configuration.device = id
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
