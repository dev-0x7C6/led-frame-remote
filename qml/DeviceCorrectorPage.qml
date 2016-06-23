import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import "components"

Item {
	ColumnLayout {
		spacing: 10
		anchors.fill: parent
		anchors.topMargin: 20
		anchors.bottomMargin: 20
		width: parent.width

		DisplayIcon {
			id: icon
			width: 224
			height: 224
			borderColor: "white"
			anchors.horizontalCenter: parent.horizontalCenter

			borderRadius: 4
			ambientRadius: 32
		}

		Item {
			Layout.fillHeight: true
			Layout.fillWidth: true

			ColumnLayout {
				anchors.fill: parent
				anchors.leftMargin: 20
				anchors.rightMargin: 20

				CustomSliderStyle {
					Layout.fillWidth: true
					id: lSlider
					color: "white"
					onValueChanged: {
						if (pressed) configuration.globalBrightness = value
						icon.color.a = value;
					}
				}

				CustomSliderStyle {
					id: rSlider
					Layout.fillWidth: true
					color: "tomato"
					onValueChanged: {
						if (pressed) configuration.globalRedCorrection = value
						icon.color.r = value;
					}
				}

				CustomSliderStyle {
					id: gSlider
					Layout.fillWidth: true
					color: "lightGreen"
					onValueChanged: {
						if (pressed) configuration.globalGreenCorrection = value
						icon.color.g = value;
					}
				}

				CustomSliderStyle {
					id: bSlider
					Layout.fillWidth: true
					color: "lightBlue"
					onValueChanged: {
						if (pressed) configuration.globalBlueCorrection = value
						icon.color.b = value;
					}
				}
			}
		}
	}

	readonly property double l: configuration.globalBrightness
	readonly property double r: configuration.globalRedCorrection
	readonly property double g: configuration.globalGreenCorrection
	readonly property double b: configuration.globalBlueCorrection

	onLChanged: if (!lSlider.pressed) lSlider.value = l
	onRChanged: if (!rSlider.pressed) rSlider.value = r
	onGChanged: if (!gSlider.pressed) gSlider.value = g
	onBChanged: if (!bSlider.pressed) bSlider.value = b

	Component.onCompleted: {
		lSlider.value = configuration.globalBrightness;
		rSlider.value = configuration.globalRedCorrection;
		gSlider.value = configuration.globalGreenCorrection;
		bSlider.value = configuration.globalBlueCorrection;
	}
}


