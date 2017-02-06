import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "components/"

BorderImage {
	border.bottom: 8
	width: parent.width
	height: 80

	property string title: ""

	Rectangle {
		anchors.fill: parent
		color: "#101020"
	}

	PrettyLabel {
		anchors.fill: parent
		text: title
	}


//	Item {
//		anchors.fill: parent
//		anchors.topMargin: 4
//		anchors.bottomMargin: 8
//		anchors.leftMargin: 8
//		anchors.rightMargin: 8

//		property double widthFactor: label.contentWidth * 3


//		Image {
//			source: "qrc:/devices/title.png"
//			anchors.centerIn: parent
//			height: parent.height
//			width: (parent.widthFactor > 200) ? parent.widthFactor : 200
//			fillMode: Image.Stretch
//			opacity: parent.opacity * 0.5
//		}

//		Label {
//			id: label
//			anchors.centerIn: parent
//			fontSizeMode: Text.Fit
//			elide: Text.ElideRight
//			font.bold: true
//			font.pointSize: 20
//			text: title
//			verticalAlignment: Text.AlignVCenter
//		}
//	}
}
