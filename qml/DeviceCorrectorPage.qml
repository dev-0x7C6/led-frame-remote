import QtQuick 2.6
import QtQuick.Controls 1.4
import Qt.labs.controls 1.0

import "components"

Item {
	Column {
		spacing: 10
		anchors.topMargin: 10
		width: parent.width

		DisplayIcon {
			id: icon
			width: 196
			height: 196
			borderColor: "white"
			anchors.horizontalCenter: parent.horizontalCenter
			borderRadius: 4
			ambientRadius: 32
		}

		CustomSliderStyle {
			id: brightnessSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "white"
			handleColor: "white"
			handleBorderColor: "black"
			stepSize: 0.01
			onValueChanged: {
				configuration.brightness = value
				icon.color.a = value;
			}
		}

		CustomSliderStyle {
			id: redSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "tomato"
			handleColor: "tomato"
			handleBorderColor: "black"
			stepSize: 0.01
			onValueChanged: {
				configuration.redCorrection = value
				icon.color.r = value;
			}
		}

		CustomSliderStyle {
			id: greenSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightGreen"
			handleColor: "lightGreen"
			handleBorderColor: "black"
			stepSize: 0.01
			onValueChanged: {
				configuration.greenCorrection = value
				icon.color.g = value;
			}
		}

		CustomSliderStyle {
			id: blueSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightBlue"
			handleColor: "lightBlue"
			handleBorderColor: "black"
			stepSize: 0.01
			onValueChanged: {
				configuration.blueCorrection = value
				icon.color.b = value;
			}
		}
	}


	function update(l, r, g, b) {
		if (!brightnessSlider.pressed)
			brightnessSlider.value = l

		if (!redSlider.pressed)
			redSlider.value = r

		if (!greenSlider.pressed)
			greenSlider.value = g

		if (!blueSlider.pressed)
			blueSlider.value = b
	}
}


