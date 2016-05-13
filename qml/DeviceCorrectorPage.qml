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
			id: brightnessSlider
			value: configuration.data.brightness
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightGray"
			onValueChanged: configuration.setBrightness(value)
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
			id: redSlider
			value: configuration.data.rcorrector
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "tomato"
			onValueChanged: configuration.setRedFactor(value)
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
			id: greenSlider
			value: configuration.data.gcorrector
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightGreen"
			onValueChanged: configuration.setGreenFactor(value)
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
			id: blueSlider
			value: configuration.data.bcorrector
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightBlue"
			onValueChanged: configuration.setBlueFactor(value)
		}
	}

	function configurationUpdated() {
		brightnessSlider.value = configuration.data.brightness
		redSlider.value = configuration.data.rcorrector
		greenSlider.value = configuration.data.gcorrector
		blueSlider.value = configuration.data.bcorrector
	}
}
