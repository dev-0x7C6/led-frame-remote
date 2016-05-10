import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import Qt.labs.controls 1.0

Item {
	anchors.fill: parent

	SwipeView {
		id: view

		currentIndex: 0
		anchors.fill: parent

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
