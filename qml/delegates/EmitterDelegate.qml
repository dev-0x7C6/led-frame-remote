import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../components"

BaseDelegate {

	color: selected ? selectedBackgroundColor : backgroundColor
	height: selected ? implicitHeight * 2 : implicitHeight

	Behavior on height { NumberAnimation{ duration: 200; } }


	ColumnLayout {
		anchors.left: iconObject.icon.right
		anchors.leftMargin: 30
		anchors.verticalCenter: parent.verticalCenter

		Item {
			width: deviceLabel.width
			height: deviceLabel.height
			Text {
				id: deviceLabel
				font.pixelSize: 24
				font.bold: true
				color: firstLabelColor
				text: name
			}

			DropShadow {
				 anchors.fill: deviceLabel
				 horizontalOffset: 2
				 verticalOffset: 2
				 radius: 8.0
				 samples: 17
				 color: Qt.darker(firstLabelColor, 3)
				 source: deviceLabel
			}
		}

		Text {
			font.pixelSize: 14
			font.bold: true
			text: description
			color: secondLabelColor
		}

		Text {
			font.pixelSize: 10
			font.italic: true
			text: parameters
			color: thirdLabelColor
			visible: selected
		}
	}
}
