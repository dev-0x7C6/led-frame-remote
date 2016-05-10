import QtQuick 2.6
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import Qt.labs.controls 1.0

Pane {
	id: pane

	Column {
		spacing: 40
		anchors.centerIn: parent


		BusyIndicator {
			readonly property int size: Math.min(pane.availableWidth, pane.availableHeight) / 5
			width: size
			height: size
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			width: parent.width
			horizontalAlignment: Qt.AlignHCenter
			text: "Waiting for devices..."
		}
	}
}
