import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import "../components"

BaseDelegate {
	id: base
	property double iconOpacity : 1.0
	property bool iconRotation : false
	property string iconSource

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

		opacity: iconOpacity
		fillMode: Image.PreserveAspectFit
		source: iconSource
		smooth: true
		cache: true

		RotationAnimator {
			target: image;
			from: 0;
			to: 360;
			loops: Animation.Infinite
			duration: 10000
			running: iconRotation
		}
	}

	DefaultLabel {
		id: name
		anchors.leftMargin: leftMarginForLabels
		anchors.topMargin: 18
		anchors.left: image.right
		anchors.top: parent.top
		text: datagram.name;
		font.bold: true;
		font.pixelSize: nameSize
		color: firstLabelColor
	}

	DefaultLabel {
		id: type
		anchors.leftMargin: leftMarginForLabels
		anchors.top: name.bottom
		anchors.left: image.right
		text: datagram.type;
		font.bold: true;
		font.pixelSize: typeSize
		color: secondLabelColor
	}

	DefaultLabel {
		anchors.leftMargin: leftMarginForLabels
		anchors.top: type.bottom
		anchors.left: image.right
		text: datagram.name;
		font.bold: true;
		font.pixelSize: detailSize
		color: thirdLabelColor
	}
}
