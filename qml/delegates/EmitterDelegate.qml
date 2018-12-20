import QtQuick 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12

import "../components"
import "../js/functions.js" as Logic

BaseDelegate {
	property double iconOpacity : 1.0
	property bool iconRotation : false
	property string iconSource

	RowLayout {
		anchors.fill: parent

		Image {
			id: image
			opacity: iconOpacity
			Layout.fillHeight: true
			fillMode: Image.PreserveAspectFit
			source: iconSource
			smooth: true
			cache: true

			RotationAnimator {
				target: image;
				from: 0;
				to: 360;
				loops: Animation.Infinite
				duration: 5000
				running: iconRotation
			}
		}

		ColumnLayout {
			spacing: 0
			Layout.fillWidth: true
			Layout.fillHeight: true

			Item {
				Layout.fillWidth: true
				Layout.fillHeight: true
			}

			DefaultLabel {
				text: datagram.name;
				font.pixelSize: largeFont
				color: firstLabelColor
			}

			DefaultLabel {
				text: datagram.type;
				font.pixelSize: mediumFont
				color: secondLabelColor
			}

			DefaultLabel {
				text: datagram.name;
				font.pixelSize: smallFont
				color: thirdLabelColor
			}

			Item {
				Layout.fillWidth: true
				Layout.fillHeight: true
			}
		}
	}
}
