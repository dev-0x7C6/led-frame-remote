import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

BorderImage {
	border.bottom: 8
	//source: "qrc:/splash.png"
	width: parent.width
	height: 80

	property string title: ""

	Rectangle {
		anchors.fill: parent
		color: "#10ffffff"
	}

	RowLayout {
		anchors.fill: parent
		anchors.leftMargin: 20
		anchors.rightMargin: 20
		spacing: 25

		Image {
			Layout.preferredHeight: 48
			Layout.preferredWidth: 48
			source: "qrc:/config.png"
			fillMode: Image.PreserveAspectFit

			MouseArea {
				anchors.fill: parent
				onClicked: applicationDrawer.open()
			}
		}


		Label {
			Layout.fillWidth: true
			Layout.fillHeight: true
			fontSizeMode: Text.Fit
			elide: Text.ElideRight
			font.bold: true
			font.pointSize: 16
			text: title
			verticalAlignment: Text.AlignVCenter
		}
	}
}
