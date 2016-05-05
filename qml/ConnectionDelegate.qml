import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0

Rectangle {
	id: connectionDelegate
	width: parent.width;
	height: 128
	color: "lightgray"

	Image {
		id: imageItem
		height: parent.height;
		width: 128
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
			text: "navi"
		}

		Text {
			id: itexItem
			font.pixelSize: 12
			text: "192.168.1.230:2222"
		}

	}
}
