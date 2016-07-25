import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4

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

	function correctorType(arg) {
		if (arg === 0) return "Color enhancer"
		if (arg === 1) return "Brightness"
		if (arg === 2) return "RGB Correction"
		if (arg === 3) return "Flickr effect"
		return "Unknown"
	}

	ColumnLayout {
		anchors.fill: delegate
		anchors.leftMargin: 20
		anchors.rightMargin: 20
		spacing: 0

		DefaultLabel {
			Layout.fillWidth: true
			Layout.minimumWidth: 0
			text: correctorType(type);
			font.bold: true;
			font.pixelSize: 22
		}

		CustomSliderStyle {
			color: Qt.lighter(base.color, 8)
			Layout.fillWidth: true
			Layout.minimumWidth: 0
			minimumValue: base.min
			maximumValue: base.max
			Component.onCompleted: value = base.value
			onValueChanged: base.value = value
		}
	}
}
