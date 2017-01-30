import QtQuick 2.8
import QtQuick.Controls 2.1

import "delegates"

Item {
	ListView {
		id: clientListView
		anchors.fill: parent
		model: clientModel
		delegate: DeviceDelegate {
			width: parent.width
			height: 112
			color: clientListView.currentIndex === index ? sg : bg
			opacity: 1.0

			MouseArea {
				anchors.fill: parent
				onClicked: {
					clientListView.currentIndex = index
					configuration.name = device
					onClientSelected(host, port, id)
				}
			}
		}
	}

	function onClientSelected(host, port, id) {}

	function insert(arg) {
		clientModel.append(arg)
	}
}
