import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

BorderImage {
	border.bottom: 8
	width: parent.width
	height: 80

	property string title: ""

	Rectangle {
		anchors.fill: parent
		color: "#101020"
	}

	RowLayout {
		anchors.fill: parent
		anchors.leftMargin: 20
		anchors.rightMargin: 20
		spacing: 25

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
