import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

import "../components"

BaseDelegate {
	id: delegate

	RowLayout {
		id: rowLayout
		anchors.fill: parent
		anchors.leftMargin: 10
		anchors.rightMargin: 10
		spacing: 10

		Image {
			source: "qrc:/devices/usb.png"
			Layout.fillHeight: true
			fillMode: Image.PreserveAspectFit
		}

		Item {
			Layout.fillWidth: true
			Layout.fillHeight: true

			ColumnLayout {
				anchors.fill: parent
				anchors.topMargin: 24
				anchors.bottomMargin: 24

				DefaultLabel {
					text: device;
					font.bold: true;
					font.pixelSize: 22
				}

				DefaultLabel {
					text: "computer: " + computer;
					color: secondLabelColor
					font.pixelSize: 16
				}

				DefaultLabel {
					text: "hostname: " + host + ":" + port;
					font.italic:  true;
					color: thirdLabelColor
					font.pixelSize: 10
				}
			}
		}
	}
}
