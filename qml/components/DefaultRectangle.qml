import QtQuick 2.11

Rectangle {
	readonly property color bg: "#ff101020"
	readonly property color sg: Qt.lighter(bg, 2.0)
	property bool selected: false
	color: selected ? sg: bg

	Behavior on color { ColorAnimation { duration: 500 } }
}
