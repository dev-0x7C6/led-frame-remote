import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

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
