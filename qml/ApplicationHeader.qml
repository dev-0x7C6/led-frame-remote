import QtQuick 2.11
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.4

import "components/"

Item {
	width: parent.width
	height: 60

	property string title: ""

	Rectangle {
		anchors.fill: parent
		color: "#101020"
	}

	PrettyLabel {
		anchors.fill: parent
		text: title
	}
}
