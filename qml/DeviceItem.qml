import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import QtQuick.Controls.Styles 1.4

Rectangle {
	width: parent.width
	height: 160
	color: "darkOrange"

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
			text: computer
		}

		Text {
			font.pixelSize: 10
			text: host + ":" + port
		}

		ProgressBar {
			id: itemConnectionIndicator
			indeterminate: true
			width: itemWidth
			anchors.horizontalCenter: parent.horizontalCenter
			visible: false
		}

	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
			itemConnectionIndicator.visible = true
			deviceControlPage.hostName = host
			deviceControlPage.hostPort = port
			deviceControlPage.updateSocketConfiguration()
		}
	}

}
