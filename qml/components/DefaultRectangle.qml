import QtQuick 2.8

Rectangle {
	readonly property color bg: "#101020"
	readonly property color sg: Qt.lighter(bg, 2.0)
	property bool selected: false
	color: selected ? sg: bg

	Behavior on color { ColorAnimation { duration: 200 } }

	Rectangle {
		anchors.bottom: parent.bottom
		width: parent.width
		height: 2
		color: Qt.darker(parent.color, 2)
	}
}
