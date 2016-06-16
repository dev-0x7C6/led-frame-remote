import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../components"

Rectangle {
	id: item
	property color backgroundColor: "#101020"
	property color selectedBackgroundColor: Qt.darker("chocolate", 4.0)
	//property color selectedBackgroundColor: Qt.darker("magenta", 8.0)
	property color firstLabelColor: "orange"
	property color secondLabelColor: "#a0a0a0"
	property color thirdLabelColor: "#606060"
	property bool iconVisible: true
	property var iconObject: icon

	color: backgroundColor

	Behavior on color {
		ColorAnimation { duration: 200 }
	}

	Rectangle {
		anchors.bottom: parent.bottom
		width: parent.width
		height: 2
		color: Qt.darker(item.color, 2)
	}

	DisplayIcon {
		id: icon
		anchors.leftMargin: 20
		anchors.left: parent.left
		borderRadius: 4
		borderColor: "orange"
		ambientRadius: 8
		height: parent.height;
		width: parent.height;
		visible: iconVisible
	}

	SequentialAnimation {
		loops: Animation.Infinite
		running: item.visible
		ColorAnimation { target: icon; property: "color"; to: "#ff4444"; duration: 3000 }
		ColorAnimation { target: icon; property: "color"; to: "#44ff44"; duration: 3000 }
		ColorAnimation { target: icon; property: "color"; to: "#4444ff"; duration: 3000 }
	}

}
