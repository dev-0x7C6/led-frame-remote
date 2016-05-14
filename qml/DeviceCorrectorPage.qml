import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.controls 1.0

Pane {
	Column {
		spacing: 20
		anchors.fill: parent

		GroupBox {
			title: "Brightness"
			width: parent.width
			CustomSliderStyle {
				id: brightnessSlider
				width: parent.width
				value: configuration.data.brightness
				anchors.horizontalCenter: parent.horizontalCenter
				sliderColor: "white"
				handleColor: "white"
				handleBorderColor: "black"
				onValueChanged: configuration.setBrightness(value)
			}
		}

		GroupBox {
			title: "RGB Correction"
			anchors.horizontalCenter: parent.horizontalCenter
			width: parent.width
			Column {
				spacing: 20
				anchors.fill: parent

			CustomSliderStyle {
				id: redSlider
				width: parent.width
				value: configuration.data.rcorrector
				anchors.horizontalCenter: parent.horizontalCenter
				sliderColor: "tomato"
				handleColor: "tomato"
				handleBorderColor: "black"
				onValueChanged: configuration.setRedFactor(value)
			}

			CustomSliderStyle {
				id: greenSlider
				width: parent.width
				value: configuration.data.gcorrector
				anchors.horizontalCenter: parent.horizontalCenter
				sliderColor: "lightGreen"
				handleColor: "lightGreen"
				handleBorderColor: "black"
				onValueChanged: configuration.setGreenFactor(value)
			}

			CustomSliderStyle {
				id: blueSlider
				width: parent.width
				value: configuration.data.bcorrector
				anchors.horizontalCenter: parent.horizontalCenter
				sliderColor: "lightBlue"
				handleColor: "lightBlue"
				handleBorderColor: "black"
				onValueChanged: configuration.setBlueFactor(value)
			}
		}}
	}

	function configurationUpdated() {
		brightnessSlider.value = configuration.data.brightness
		redSlider.value = configuration.data.rcorrector
		greenSlider.value = configuration.data.gcorrector
		blueSlider.value = configuration.data.bcorrector
	}
}
