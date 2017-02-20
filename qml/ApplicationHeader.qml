import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "components/"

Item {
	width: parent.width
	height: 80

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
