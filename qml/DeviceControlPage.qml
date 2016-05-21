import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Controls 1.4
import "emitters"

Item {
	id: canvas

	SwipeView {
		id: view
		anchors.fill: parent

		currentIndex: 0

		DeviceCorrectorPage {
			id: deviceCorrectorPage
		}

//		EmitterControlPage {
//		}


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
