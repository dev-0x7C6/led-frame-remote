import QtQuick 2.6
import QtQuick.Controls 2.0

import "emitters"
import "delegates"

Item {
	id: canvas

	SwipeView {
		id: emitterView

		currentIndex: 0
		anchors.fill: parent

		Item {
			id: emitterManager
			ListView {
				id: emitterListView
				anchors.fill: parent
				model: emitterModel
				delegate: EmitterDelegate {
					id: delegate
					width: parent.width
					implicitHeight: 80

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

		DeviceCorrectorPage {
			id: deviceCorrectorPage
		}


		function indexChanged() {
			subtitle.text = configuration.device
			if (currentItem == deviceCorrectorPage)
				title.text = "Color correction"

			if (currentItem == emitterManager)
				title.text = "Emitters"
		}

		onCurrentIndexChanged: indexChanged()
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
		emitterView.indexChanged()
	}

}
