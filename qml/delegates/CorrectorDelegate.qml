import QtQuick 2.8
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "../js/functions.js" as Logic
import "../components"
import ".."

BaseDelegate {
	id: base
	property double min: 0
	property double max: 1
	property double value: 0.5
	property double iconOpacity : 1.0
	property bool iconRotation : false
	property string iconSource

	anchors.leftMargin: 20
	anchors.rightMargin: 20

	Image {
		id: image
		source: Logic.correctorIconFromType(datagram.type);
		anchors.left: parent.left
		height: parent.height
		width: parent.height
		fillMode: Image.PreserveAspectFit
		opacity: parent.opacity
	}


	ColumnLayout {
		anchors.left: image.right
		width: parent.width - image.paintedWidth
		height: parent.height
		anchors.leftMargin: 20
		anchors.rightMargin: 20
		spacing: 0

		DefaultLabel {
			Layout.fillWidth: true
			Layout.minimumWidth: 0
			text: Logic.correctorTextFromType(datagram.type);
			font.bold: true;
			font.pixelSize: 20
		}

		Slider {
			Material.accent: Qt.lighter(base.color, 8)
			Layout.fillWidth: true
			Layout.minimumWidth: 0
			from: base.min
			to: base.max
			stepSize: 1
			Component.onCompleted: value = base.value
			onValueChanged: base.value = value
		}
	}
}
