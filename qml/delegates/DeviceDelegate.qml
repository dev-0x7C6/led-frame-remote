import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

import "../components"

BaseDelegate {
	RowLayout {
		anchors.fill: parent

		Image {
			Layout.fillHeight: true
			fillMode: Image.PreserveAspectFit
			source: "qrc:/devices/usb.png"
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
				id: name
				text: device;
				font.bold: true;
				font.pixelSize: largeFont
				color: firstLabelColor
			}

			DefaultLabel {
				id: type
				text: "computer: " + computer;
				font.bold: true;
				font.pixelSize: mediumFont
				color: secondLabelColor
			}

			DefaultLabel {
				text: "hostname: " + host + ":" + port;
				font.bold: true;
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
