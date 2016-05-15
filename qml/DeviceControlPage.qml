import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Extras 1.4


Item {
	anchors.fill: parent

	SwipeView {
		id: view

		currentIndex: 0
		anchors.fill: parent

		DeviceCorrectorPage {
			id: deviceCorrectorPage
		}

		Pane {
			Column {
				anchors.fill: parent

				Tumbler {
					width: parent.width
					TumblerColumn {
						width: parent.width
						model: ListModel {
							id: cbItems
							ListElement { text: "LedFrame#2"; color: "Yellow" }
							ListElement { text: "LedFrame#1"; color: "Green" }
							ListElement { text: "LedFrame#3"; color: "Brown" }
						}
						role: "text"
					}

				}

			}
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
