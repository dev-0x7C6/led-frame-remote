import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Slider {
	style: SliderStyle {
		groove: Rectangle {
			implicitWidth: 200
			implicitHeight: 8
			color: "darkOrange"
			radius: 8
		}

		handle: Rectangle {
			anchors.centerIn: parent
			color: control.pressed ? "orange" : "black"
			border.color: "#df6c00"
			border.width: 2
			implicitWidth: 32
			implicitHeight: 32
			radius: 16
		}
	}
}
