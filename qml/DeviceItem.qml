import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Layouts 1.3

Rectangle {
	width: parent.width;
	height: 160
	color: "#dddddd"

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
			id: itexItem2
			font.pixelSize: 32
			font.bold: true
			text: computer
		}

		Text {
			id: itexItem
			font.pixelSize: 12
			text: host + ":" + port
		}

	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
			mainStackView.push(deviceControlPage);
		}
	}
}
