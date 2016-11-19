import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import "../components"

BaseDelegate {
	id: base
	property double iconOpacity : 1.0
	property bool iconRotation : false
	property string iconSource

	RowLayout {
		anchors.fill: delegate
		anchors.leftMargin: 20
		anchors.rightMargin: 20
		spacing: 10

		Item {
			height: parent.height / 1.1
			width: parent.height / 1.1
			opacity: iconOpacity
			Image {
				id: lcd
				anchors.fill: parent
				fillMode: Image.PreserveAspectFit
				source: iconSource
				smooth: true
				cache: true

				RotationAnimator {
					target: lcd;
					from: 0;
					to: 360;
					loops: Animation.Infinite
					duration: 10000
					running: iconRotation
				}

			}

			Behavior on opacity { NumberAnimation { duration: 200 } }
		}

		ColumnLayout {
			DefaultLabel {
				Layout.fillWidth: true
				Layout.minimumWidth: 0
				text: datagram.name;
				font.bold: true;
				font.pixelSize: 22
			}

			DefaultLabel {
				Layout.fillWidth: true
				Layout.minimumWidth: 0
				text: datagram.type
				color: secondLabelColor
				font.pixelSize: 16
			}

			DefaultLabel {
				Layout.fillWidth: true
				Layout.minimumWidth: 0
				text: "";
				font.italic:  true;
				color: thirdLabelColor
				font.pixelSize: 10
			}
		}
	}
}
