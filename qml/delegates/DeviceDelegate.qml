import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

import "../components"

BaseDelegate {
	id: delegate

	RowLayout {
		anchors.fill: delegate
		anchors.leftMargin: 20
		anchors.rightMargin: 20
		spacing: 25

		DisplayIcon {
			id: icon
			borderColor: "orange"
			ambientRadius: 6
			height: parent.height / 1.2;
			width: parent.height / 1.2;

			SequentialAnimation {
				loops: Animation.Infinite
				running: icon.visible
				ColorAnimation { target: icon; property: "color"; to: "#ff4444"; duration: 3000 }
				ColorAnimation { target: icon; property: "color"; to: "#44ff44"; duration: 3000 }
				ColorAnimation { target: icon; property: "color"; to: "#4444ff"; duration: 3000 }
			}
		}

		ColumnLayout {
			DefaultLabel {
				Layout.fillWidth: true
				Layout.minimumWidth: 0
				text: device;
				font.bold: true;
				font.pixelSize: 22
			}

			DefaultLabel {
				Layout.fillWidth: true
				Layout.minimumWidth: 0
				text: computer;
				color: secondLabelColor
				font.pixelSize: 16
			}

			DefaultLabel {
				Layout.fillWidth: true
				Layout.minimumWidth: 0
				text: host + ":" + port;
				font.italic:  true;
				color: thirdLabelColor
				font.pixelSize: 10
			}
		}
	}
}
