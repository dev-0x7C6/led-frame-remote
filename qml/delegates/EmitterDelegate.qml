import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../components"

BaseDelegate {
	ColumnLayout {
		anchors.fill: parent
		DefaultLabel {
			text: name
			font.pixelSize: 16
		}

		DefaultLabel {
			text: description
			font.pixelSize: 12
			color: secondLabelColor
		}

		DefaultLabel {
			text: parameters
			font.pixelSize: 10
			color: thirdLabelColor
		}

//		Text {
//			font.pixelSize: 14
//			font.bold: true
//			text: description
//			color: secondLabelColor
//		}

//		Text {
//			font.pixelSize: 10
//			font.italic: true
//			text: parameters
//			color: thirdLabelColor
//			visible: selected
//		}
	}
}
