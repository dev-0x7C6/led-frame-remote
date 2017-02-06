import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
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
			anchors.horizontalCenter: parent.horizontalCenter

			borderRadius: 4
			ambientRadius: 32
		}

		Item {
			Layout.fillHeight: true
			Layout.fillWidth: true

			ColumnLayout {
				anchors.fill: parent
				anchors.leftMargin: 40
				anchors.rightMargin: 40

				Slider {
					Layout.fillWidth: true
					id: lSlider
					value: 1
					from: 0
					to: 255
					stepSize: 1
					Material.accent: "white"

					onValueChanged: {
						if (pressed) configuration.globalLValue = value
						icon.color.a = value / 255.0;
					}
				}

				Slider {
					id: rSlider
					value: 1
					from: 0
					to: 255
					stepSize: 1
					Layout.fillWidth: true
					Material.accent: "tomato"
					onValueChanged: {
						if (pressed) configuration.globalRValue = value
						icon.color.r = value / 255.0;
					}
				}

				Slider {
					id: gSlider
					value: 1
					from: 0
					to: 255
					stepSize: 1
					Layout.fillWidth: true
					Material.accent: "lightGreen"
					onValueChanged: {
						if (pressed) configuration.globalGValue = value
						icon.color.g = value / 255.0;
					}
				}

				Slider {
					id: bSlider
					value: 1
					from: 0
					to: 255
					stepSize: 1
					Layout.fillWidth: true
					Material.accent: "lightBlue"
					onValueChanged: {
						if (pressed) configuration.globalBValue = value
						icon.color.b = value / 255.0;
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


