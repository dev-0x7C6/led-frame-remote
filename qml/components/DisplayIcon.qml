import QtQuick 2.11
import QtGraphicalEffects 1.0

Item {
	property color color: "orange"
	property double borderRadius: 4
	property double ambientRadius: 16

	RectangularGlow {
		id: effect
		anchors.topMargin: 52
		anchors.bottomMargin: 64
		anchors.leftMargin: 32
		anchors.rightMargin: 32
		anchors.fill: parent
		glowRadius: ambientRadius
		spread: 0.1
		color: parent.color
		cornerRadius: glowRadius * 1.5
		cached: false
	}

	Image {
		id: image
		anchors.fill: parent
		fillMode: Image.PreserveAspectFit
		source: "qrc:/splash/desktop.png"
		smooth: true
		cache: false
	}
}
