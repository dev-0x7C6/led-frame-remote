import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

Item {
	id: canvas
	property string text

	Column {
		spacing: 40
		anchors.centerIn: parent

		BusyIndicator {
			readonly property int size: Math.min(canvas.width, canvas.height) / 4
			width: size
			height: size
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			width: parent.width
			horizontalAlignment: Qt.AlignHCenter
			text: canvas.text
			font.pixelSize: 16
		}

	}
}
