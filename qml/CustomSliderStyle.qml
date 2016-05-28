import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Slider {
	id: slider
	property color color: "orange"

	style: SliderStyle {
		groove: Rectangle {
			opacity: 1.0
			id: control
			anchors.centerIn: parent
			implicitWidth: 300
			implicitHeight: 16
			color: "transparent"

			Rectangle {
				anchors.fill: parent
				anchors.margins: 5
				color: Qt.darker(slider.color, 4.0)
				radius: 3
			}

			Rectangle {
				id: grooveFill
				anchors.verticalCenter: parent.verticalCenter
				anchors.left: parent.left
				width: styleData.handlePosition
				anchors.margins: 5
				height:6
				color: Qt.darker(slider.color, 2.0)
				radius: 3
			}
		}

		handle: Rectangle {
			anchors.centerIn: parent
			border.color: hovered || pressed ? slider.color : Qt.darker(slider.color, 2.0)
			color: Qt.darker(slider.color, 4.0)
			border.width: 3
			implicitWidth: 32
			implicitHeight: 32
			radius: implicitWidth / 2

			Behavior on border.color {
				ColorAnimation { duration: 200 }
			}
		}
	}
}
