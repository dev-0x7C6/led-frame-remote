import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import "components/"

Rectangle {
	color: "#101020"
	width: parent.width
	height: 70

	property alias title: title.text

	PrettyLabel {
		id: title
		anchors.fill: parent
		fontSize: 20
	}
}
