import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Pane {
	Column {
		spacing: 20
		anchors.fill: parent

		Label {
			width: parent.width
			color: "gray"
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Brightness"
			font.pixelSize: 18
			font.bold: true
		}

		CustomSliderStyle {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			color: "gray"
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Red correction"
			font.pixelSize: 18
			font.bold: true
		}

		CustomSliderStyle {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			color: "gray"
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Green correction"
			font.pixelSize: 18
			font.bold: true
		}

		CustomSliderStyle {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			color: "gray"
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Blue correction"
			font.pixelSize: 18
			font.bold: true
		}

		CustomSliderStyle {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}
}
