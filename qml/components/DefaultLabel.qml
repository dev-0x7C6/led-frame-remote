import QtQuick 2.8
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0

Label {
	id: base
	color: "orange"

	property bool dropEffectEnabled : true

	font.bold: true
	minimumPointSize: 4
	fontSizeMode: Text.Fit
	elide: Text.ElideRight
}

