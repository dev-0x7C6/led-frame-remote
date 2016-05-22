import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../components"

BaseDelegate {
	id: delegate
	ColumnLayout {
		anchors.left: iconObject.right
		anchors.leftMargin: 30
		anchors.verticalCenter: parent.verticalCenter


		Item {
			width: deviceLabel.width
			height: deviceLabel.height
			Text {
				id: deviceLabel
				font.pixelSize: 32
				font.bold: true
				color: delegate.firstLabelColor
				text: device
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
			font.pixelSize: 16
			font.bold: true
			text: "host: " + computer
			color: delegate.secondLabelColor
		}

		Text {
			font.pixelSize: 10
			font.italic: true
			text: host + ":" + port
			color: delegate.thirdLabelColor
		}
	}
}
