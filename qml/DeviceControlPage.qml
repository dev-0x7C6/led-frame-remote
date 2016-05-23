import QtQuick 2.6
import Qt.labs.controls 1.0

import "emitters"
import "delegates"

Item {
	id: canvas

	SwipeView {
		id: emitterView

		currentIndex: 0
		anchors.fill: parent

		DeviceCorrectorPage {
			id: deviceCorrectorPage
		}

		Item {
			ListView {
				id: emitterListView
				anchors.fill: parent
				model: emitterModel
				delegate: EmitterDelegate {
					id: delegate
					width: parent.width
					height: 90
					iconVisible: false

					MouseArea {
						anchors.fill: parent
						onClicked: {
							if (emitterListView.currentIndex == -1)
								return

							emitterModel.setProperty(emitterListView.currentIndex, "selected", false)
							emitterModel.setProperty(index, "selected", true)
							emitterListView.currentIndex = index
						}
					}
				}

				onCurrentIndexChanged: configuration.emitter = emitterModel.get(currentIndex).name
			}
		}
	}

	PageIndicator {
		id: indicator

		count: emitterView.count
		currentIndex: emitterView.currentIndex

		anchors.bottom: emitterView.bottom
		anchors.horizontalCenter: parent.horizontalCenter
	}

	function update() {
		deviceCorrectorPage.update();
	}

}
