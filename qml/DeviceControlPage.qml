import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Controls 1.4


Item {
	id: canvas
	anchors.margins: 100

	SwipeView {
		id: view

		currentIndex: 0
		x: parent.x + 10
		y: parent.y + 10
		width: parent.width - 20
		height: parent.height - 20

		DeviceCorrectorPage {
			id: deviceCorrectorPage
		}
	}

	PageIndicator {
		id: indicator

		count: view.count
		currentIndex: view.currentIndex

		anchors.bottom: view.bottom
		anchors.horizontalCenter: parent.horizontalCenter
	}

	function configurationUpdated() {
		deviceCorrectorPage.configurationUpdated();
	}

}
