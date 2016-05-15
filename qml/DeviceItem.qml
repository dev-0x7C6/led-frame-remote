import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import QtQuick.Controls.Styles 1.4

Rectangle {
	id: item
	width: parent.width
	height: 160
	color: "darkOrange"

	Rectangle {
		anchors.bottom: parent.bottom
		width: parent.width
		height: 2
		color: Qt.darker(item.color, 1.2)
	}

	Image {
		id: imageItem
		height: parent.height;
		width: 160
		anchors.left: parent.left
		source: "qrc:/device.png"
	}

	ColumnLayout {
		anchors.left: imageItem.right
		anchors.leftMargin: 20
		anchors.verticalCenter: parent.verticalCenter

		Text {
			font.pixelSize: 32
			font.bold: true
			text: device
		}

		Text {
			font.pixelSize: 16
			font.bold: true
			text: "name: " + computer
		}


		Text {
			font.pixelSize: 10
			font.italic: true
			text: host + ":" + port
		}

		ProgressBar {
			id: itemConnectionIndicator
			indeterminate: true
			anchors.horizontalCenter: parent.horizontalCenter
			visible: false
		}

	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
			itemConnectionIndicator.visible = true
			var address = "ws://"
			address = address.concat(host, ":", port);
			webSocketClient.url = address
		}
	}

}
