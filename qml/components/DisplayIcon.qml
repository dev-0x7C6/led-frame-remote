import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
	id: item
	width: 256
	height: 256

	property string source: "qrc:/lcd256-without-glow.png"
	property color color: "orange"
	property color borderColor: "orange"
	property double radius: 4

	RectangularGlow {
		id: effect
		anchors.centerIn: item
		glowRadius: parent.height * 0.9
		spread: 0.05
		color: parent.color
		cornerRadius: 10
	}

	Glow {
		id: glow
		anchors.fill: lcd
		radius: parent.radius
		samples: parent.radius * 2
		spread: 0.0
		color: parent.borderColor
		source: lcd
		cached: true
	}

	Image {
		id: lcd
		source: parent.source
		width: parent.width
		height: parent.height
		smooth: false
	}



}
