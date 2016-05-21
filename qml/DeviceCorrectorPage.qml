import QtQuick 2.6
import QtQuick.Controls 1.4

import "components"

Item {
	Column {
		spacing: 5
		anchors.centerIn: parent
		width: parent.width * 0.95

		DisplayIcon {
			id: icon
			width: 196
			height: 196
			borderColor: "#00000000"
			anchors.horizontalCenter: parent.horizontalCenter
			radius: 64
		}

//		Label {
//			text: "Brightness:"
//			color: "white"
//			font.bold: true
//			font.pixelSize: 16
//		}

		CustomSliderStyle {
			id: brightnessSlider
			width: parent.width * 0.9
			value: configuration.data.brightness
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "white"
			handleColor: "white"
			handleBorderColor: "black"
			onValueChanged: {
				configuration.setBrightness(value)
				icon.color.a = value;
			}
		}

//		Label {
//			text: "Correction:"
//			color: "white"
//			font.bold: true
//			font.pixelSize: 16
//		}

		CustomSliderStyle {
			id: redSlider
			width: parent.width * 0.9
			value: configuration.data.rcorrector
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "tomato"
			handleColor: "tomato"
			handleBorderColor: "black"
			onValueChanged: {
				configuration.setRedFactor(value)
				icon.color.r = value;
			}
		}

		CustomSliderStyle {
			id: greenSlider
			width: parent.width * 0.9
			value: configuration.data.gcorrector
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightGreen"
			handleColor: "lightGreen"
			handleBorderColor: "black"
			onValueChanged: {
				configuration.setGreenFactor(value)
				icon.color.g = value;
			}
		}

		CustomSliderStyle {
			id: blueSlider
			width: parent.width * 0.9
			value: configuration.data.bcorrector
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightBlue"
			handleColor: "lightBlue"
			handleBorderColor: "black"
			onValueChanged: {
				configuration.setBlueFactor(value)
				icon.color.b = value;
			}
		}
	}

	function configurationUpdated() {
		if (!brightnessSlider.pressed)
			brightnessSlider.value = configuration.data.brightness

		if (!redSlider.pressed)
			redSlider.value = configuration.data.rcorrector

		if (!greenSlider.pressed)
			greenSlider.value = configuration.data.gcorrector

		if (!blueSlider.pressed)
			blueSlider.value = configuration.data.bcorrector
	}
}
