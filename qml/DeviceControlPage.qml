import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Item {
	anchors.fill: parent

	SwipeView {
		id: view

		currentIndex: 0
		anchors.fill: parent

		DeviceCorrectorPage {
			id: st
		}

		Item {
			id: firstPage
		}
		Item {
			id: secondPage
		}
		Item {
			id: thirdPage
		}

	}

	PageIndicator {
		id: indicator

		count: view.count
		currentIndex: view.currentIndex

		anchors.bottom: view.bottom
		anchors.horizontalCenter: parent.horizontalCenter
	}

}
