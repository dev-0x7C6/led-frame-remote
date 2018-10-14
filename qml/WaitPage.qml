import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import "components/"

Item {
	id: canvas
	property string text

	Column {
		spacing: 20
		anchors.centerIn: parent

		BusyIndicator {
			readonly property int size: Math.min(canvas.width, canvas.height) / 4
			width: (size > 64) ? 64 : size;
			height: (size > 64) ? 64 : size;
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			width: parent.width
			horizontalAlignment: Qt.AlignHCenter
			text: canvas.text
			font.bold: true
			font.pixelSize: 14
		}

	}
}
