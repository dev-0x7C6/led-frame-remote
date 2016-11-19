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
}

