import QtQuick 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import "../js/functions.js" as Logic
import "../components"
import ".."

BaseDelegate {
	id: base
	property int min: datagram.min
	property int max: datagram.max
	property int value: datagram.factor
	property int type : -1;
	property double iconOpacity : 1.0
	property bool iconRotation : false
	property string iconSource

	readonly property int leftMarginForIcon : 20
	readonly property int leftMarginForLabels : 25
	readonly property double factor : (slider.value / slider.to) + 0.3
	readonly property double factorOpacity: parent.opacity * 0.75 * factor
	readonly property double minOpacityFactor : 0.1

	Image {
		id: image
		source: Logic.correctorIconFromType(datagram.type);
		anchors.left: parent.left
		anchors.leftMargin: leftMarginForIcon
		height: parent.height
		width: parent.height
		fillMode: Image.PreserveAspectFit
		opacity: (factorOpacity < minOpacityFactor) ? minOpacityFactor : factorOpacity
		Behavior on opacity { NumberAnimation{} }
	}

	DefaultLabel {
		id: name
		anchors.leftMargin: leftMarginForLabels
		anchors.topMargin: 18
		anchors.left: image.right
		anchors.top: parent.top
		text: Logic.correctorTextFromType(datagram.type);
		font.bold: true;
		font.pixelSize: largeFont
		color: "orange"
		opacity: parent.opacity
	}

	Slider {
		id: slider
		Material.accent: "yellow"
		Material.primary: "white"
		anchors.leftMargin: 18
		anchors.rightMargin: 20
		anchors.topMargin: parent.height/3
		anchors.top: parent.top
		anchors.left: image.right
		anchors.right: parent.right

		from: base.min
		to: base.max
		stepSize: 1
		Component.onCompleted: value = base.value
		onValueChanged: base.value = value
		opacity: (factorOpacity < minOpacityFactor) ? minOpacityFactor : factorOpacity
		Behavior on opacity { NumberAnimation{} }
	}
}
