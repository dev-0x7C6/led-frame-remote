import QtQuick 2.11
import QtQuick.Controls 2.4

import "delegates/"

Drawer {
	id: drawer
	width: parent.width * 0.85
	height: parent.height

	ColorGrid {
		anchors.top: title.bottom
		anchors.left: title.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom

		onColorChanged: {
			configuration.setEmitterData(color);
		}
	}


}
