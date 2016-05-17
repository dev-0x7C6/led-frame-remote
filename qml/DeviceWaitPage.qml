import QtQuick 2.6
import Qt.labs.controls 1.0

Item {
	id: canvas

	Column {
		spacing: 40
		anchors.centerIn: parent

		BusyIndicator {
			readonly property int size: Math.min(canvas.width, canvas.height) / 3
			width: size
			height: size
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			width: parent.width
			horizontalAlignment: Qt.AlignHCenter
			text: "Searching for devices..."
			font.pixelSize: 12
		}

	}
}
