import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

import "../components"

BaseDelegate {
	id: delegate

	readonly property int nameSize : 24
	readonly property int typeSize : 12
	readonly property int detailSize : 10
	readonly property int leftMarginForIcon : 20
	readonly property int leftMarginForLabels : 30

	Image {
		id: image
		anchors.leftMargin: leftMarginForIcon
		anchors.left: parent.left
		anchors.top: parent.top
		height: parent.height
		width: parent.height
		fillMode: Image.PreserveAspectFit
		source: "qrc:/devices/usb.png"
		smooth: true
		cache: true
	}

	DefaultLabel {
		id: name
		anchors.leftMargin: leftMarginForLabels
		anchors.topMargin: 18
		anchors.left: image.right
		anchors.top: parent.top
		text: device;
		font.bold: true;
		font.pixelSize: nameSize
		color: firstLabelColor
	}

	DefaultLabel {
		id: type
		anchors.leftMargin: leftMarginForLabels
		anchors.top: name.bottom
		anchors.left: image.right
		text: "computer: " + computer;
		font.bold: true;
		font.pixelSize: typeSize
		color: secondLabelColor
	}

	DefaultLabel {
		anchors.leftMargin: leftMarginForLabels
		anchors.top: type.bottom
		anchors.left: image.right
		text: "hostname: " + host + ":" + port;
		font.bold: true;
		font.pixelSize: detailSize
		color: thirdLabelColor
	}
}
