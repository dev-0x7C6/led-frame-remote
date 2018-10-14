import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item {
	id: base
	width: 48
	height: 48

	property string source: ""

	Behavior on opacity { NumberAnimation{} }
	
	Rectangle {
		id: button
		anchors.centerIn: parent
		height: parent.width * 0.8
		width: parent.height * 0.8
		radius: 4
		color: "transparent"

		Image {
			anchors.fill: parent
			source: base.source
		}
	}
}
