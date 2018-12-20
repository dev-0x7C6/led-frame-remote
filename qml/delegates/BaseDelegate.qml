import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import "../components"

Rectangle {
	property bool selected: false
	readonly property color background_normal: "#ff101020"
	readonly property color background_selected: "#ff202040"
	color: selected ? background_selected: background_normal

	Behavior on color { ColorAnimation { duration: 500 } }
}
