import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
	width: 256
	height: 256

	property string source: "qrc:/lcd.png"
	property color color: "orange"
	property color borderColor: "gray"
	property double borderRadius: 4
	property double ambientRadius: 16

	RectangularGlow {
		id: effect
		x: lcd.x
		y: lcd.y + lcd.paintedHeight * 0.1
		width: lcd.paintedWidth
		height: lcd.paintedHeight * 0.86
		glowRadius: ambientRadius
		spread: 0.1
		color: parent.color
		cornerRadius: glowRadius * 1.5
		cached: false
	}

	Glow {
		id: glow
		anchors.fill: lcd
		radius: parent.borderRadius
		samples: parent.borderRadius * 2
		spread: 0.1
		color: parent.borderColor
		source: lcd
	}

	Image {
		id: lcd
		anchors.fill: parent
		fillMode: Image.PreserveAspectFit
		source: parent.source
		smooth: true
		cache: false
	}

}
