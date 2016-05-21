import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "components"

Rectangle {
	id: item
	color: "#101020"

	DisplayIcon {
		id: icon
		//source: "qrc:/device.png"
		height: parent.height;
		width: parent.height
		anchors.left: parent.left
		anchors.leftMargin: 10
	}

	SequentialAnimation {
		loops: Animation.Infinite
		running: item.visible
		ColorAnimation { target: icon; property: "color"; to: "#ff4444"; duration: 3000 }
		ColorAnimation { target: icon; property: "color"; to: "#44ff44"; duration: 3000 }
		ColorAnimation { target: icon; property: "color"; to: "#4444ff"; duration: 3000 }
	}

	Rectangle {
		anchors.bottom: parent.bottom
		width: parent.width
		height: 2
		color: Qt.darker(item.color, 2)
	}

	ColumnLayout {
		anchors.left: icon.right
		anchors.leftMargin: 30
		anchors.verticalCenter: parent.verticalCenter


		Item {
			width: deviceLabel.width
			height: deviceLabel.height
			Text {
				id: deviceLabel
				font.pixelSize: 32
				font.bold: true
				color: "orange"
				text: device
			}

			DropShadow {
				 anchors.fill: deviceLabel
				 horizontalOffset: 2
				 verticalOffset: 2
				 radius: 8.0
				 samples: 17
				 color: Qt.darker(deviceLabel.color, 3)
				 source: deviceLabel
			}
		}

		Text {
			font.pixelSize: 16
			font.bold: true
			text: "host: " + computer
			color: "#a0a0a0"
		}

		Text {
			font.pixelSize: 10
			font.italic: true
			text: host + ":" + port
			color: "#606060"
		}

	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
			var address = "ws://"
			address = address.concat(host, ":", port);
			webSocket.url = address
			configuration.device = device
		}
	}

}
