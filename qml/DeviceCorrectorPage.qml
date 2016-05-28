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
			color: "white"
			stepSize: 0.01
			onValueChanged: {
				if (pressed)
					configuration.globalBrightness = value
				icon.color.a = value;
			}

		}

		CustomSliderStyle {
			id: redSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			color: "tomato"
			stepSize: 0.01
			onValueChanged: {
				if (pressed)
					configuration.globalRedCorrection = value
				icon.color.r = value;
			}
		}

		CustomSliderStyle {
			id: greenSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			color: "lightGreen"
			stepSize: 0.01
			onValueChanged: {
				if (pressed)
					configuration.globalGreenCorrection = value
				icon.color.g = value;
			}
		}

		CustomSliderStyle {
			id: blueSlider
			width: parent.width * 0.9
			value: 0.5
			anchors.horizontalCenter: parent.horizontalCenter
			color: "lightBlue"
			stepSize: 0.01
			onValueChanged: {
				if (pressed)
					configuration.globalBlueCorrection = value
				icon.color.b = value;
			}
		}
	}


	function update() {
		if (!brightnessSlider.pressed)
			brightnessSlider.value = configuration.globalBrightness

		if (!redSlider.pressed)
			redSlider.value = configuration.globalRedCorrection

		if (!greenSlider.pressed)
			greenSlider.value = configuration.globalGreenCorrection

		if (!blueSlider.pressed)
			blueSlider.value = configuration.globalBlueCorrection
	}
}


