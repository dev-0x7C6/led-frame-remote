import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Slider {
	property color sliderColor: "darkOrange"
	property color handleColor: "black"
	property color handleColorPressed: "orange"
	property color handleBorderColor: "#101020"

	style: SliderStyle {
		groove: Rectangle {
			implicitWidth: 200
			implicitHeight: 6
			radius: 6

			gradient: Gradient {
				GradientStop { position: 0.0; color: sliderColor }
				GradientStop { position: 1.0; color: Qt.darker(sliderColor, 3.0) }
			}
		}

		handle: Rectangle {
			anchors.centerIn: parent
			border.color: handleBorderColor
			border.width: 2
			implicitWidth: 42
			implicitHeight: 42
			radius: implicitWidth / 2

			gradient: Gradient {
				GradientStop { position: 0.0; color: control.pressed ? handleColorPressed : handleColor }
				GradientStop { position: 1.0; color: Qt.darker(control.pressed ? handleColorPressed : handleColor, 3.0) }
			}
		}
	}
}
