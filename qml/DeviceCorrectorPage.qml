import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
	Column {
		spacing: 20
		anchors.fill: parent

		Label {
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Brightness"
			font.pixelSize: 18
			font.bold: true
		}

		Slider {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter

			style: SliderStyle {
				groove: Rectangle {
					implicitWidth: 200
					implicitHeight: 8
					color: "gray"
					radius: 8
				}

				handle: Rectangle {
					anchors.centerIn: parent
					color: control.pressed ? "white" : "lightgray"
					border.color: "gray"
					border.width: 2
					implicitWidth: 34
					implicitHeight: 34
					radius: 12
				}
			}
		}

		Label {
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Red correction"
			font.pixelSize: 18
			font.bold: true
		}

		Slider {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Green correction"
			font.pixelSize: 18
			font.bold: true
		}

		Slider {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Label {
			width: parent.width
			wrapMode: Label.Wrap
			horizontalAlignment: Qt.AlignLeft
			text: "Blue correction"
			font.pixelSize: 18
			font.bold: true
		}

		Slider {
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}
}
