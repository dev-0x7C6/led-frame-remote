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
						if (pressed) configuration.globalLValue = value
						icon.color.a = value;
					}
				}

				CustomSliderStyle {
					id: rSlider
					Layout.fillWidth: true
					color: "tomato"
					onValueChanged: {
						if (pressed) configuration.globalRValue = value
						icon.color.r = value;
					}
				}

				CustomSliderStyle {
					id: gSlider
					Layout.fillWidth: true
					color: "lightGreen"
					onValueChanged: {
						if (pressed) configuration.globalGValue = value
						icon.color.g = value;
					}
				}

				CustomSliderStyle {
					id: bSlider
					Layout.fillWidth: true
					color: "lightBlue"
					onValueChanged: {
						if (pressed) configuration.globalBValue = value
						icon.color.b = value;
					}
				}
			}
		}
	}

	readonly property double l: configuration.globalLValue
	readonly property double r: configuration.globalRValue
	readonly property double g: configuration.globalGValue
	readonly property double b: configuration.globalBValue

	onLChanged: if (!lSlider.pressed) lSlider.value = l
	onRChanged: if (!rSlider.pressed) rSlider.value = r
	onGChanged: if (!gSlider.pressed) gSlider.value = g
	onBChanged: if (!bSlider.pressed) bSlider.value = b

	Component.onCompleted: {
		lSlider.value = configuration.globalLValue;
		rSlider.value = configuration.globalRValue;
		gSlider.value = configuration.globalGValue;
		bSlider.value = configuration.globalBValue;
	}
}


