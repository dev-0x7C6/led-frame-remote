import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Label {
	id: base
	color: "orange"

	property bool dropEffectEnabled : true

	font.bold: true
	minimumPointSize: 4
	fontSizeMode: Text.Fit
	elide: Text.ElideRight

//	layer.enabled: dropEffectEnabled
//	layer.effect: DropShadow {
//		horizontalOffset: 2
//		verticalOffset: 2
//		radius: 8.0
//		samples: radius * 2
//		color: Qt.darker(base.color, 4.0)
//	}
}

