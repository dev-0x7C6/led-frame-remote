import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Slider {
	property color sliderColor: "darkOrange"
	property color handleColor: "black"
	property color handleColorPressed: "orange"
	property color handleBorderColor: "#df6c00"

	style: SliderStyle {
		groove: Rectangle {
			implicitWidth: 200
			implicitHeight: 8
			color: sliderColor
			radius: 8
		}

		handle: Rectangle {
			anchors.centerIn: parent
			color: control.pressed ? handleColorPressed : handleColor
			border.color: handleBorderColor
			border.width: 2
			implicitWidth: 32
			implicitHeight: 32
			radius: 16
		}
	}
}
