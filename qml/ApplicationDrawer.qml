import QtQuick 2.8
import QtQuick.Controls 2.1

import "delegates/"

Drawer {
	id: drawer
	width: parent.width * 0.66
	height: parent.height

	EmitterDelegate {

		width: parent.width
		height: 80
	}
}
