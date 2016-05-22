import QtQuick 2.6
import Qt.labs.controls 1.0

import "emitters"
import "delegates"

Item {
	id: canvas

	SwipeView {
		id: view

		currentIndex: 0
		anchors.fill: parent

		DeviceCorrectorPage {
			id: deviceCorrectorPage
		}

		Item {
			ListModel {
				id: test
				property bool progressVisible : false

				ListElement {
					name: "DVI-I-1"
					description: "Screen capture"
					parameters: "1920x1080"
					selected: false
				}

				ListElement {
					name: "Animation #1"
					description: "Animation"
					parameters: "color rotation"
					selected: false
				}

				ListElement {
					name: "Animation #2"
					description: "Animation"
					parameters: "color rotation"
				}

				ListElement {
					name: "Color #1"
					description: "Color"
					parameters: "green"
				}

				ListElement {
					name: "Color #2"
					description: "Color"
					parameters: "green"
				}
			}


			ListView {
				id: test2
				anchors.fill: parent
				model: test
				delegate: EmitterDelegate {
					id: delegate
					width: parent.width
					height: 90
					iconVisible: false

					MouseArea {
						anchors.fill: parent
						onClicked: {
							if (test2.currentIndex == -1)
								return

							test.setProperty(test2.currentIndex, "selected", false)
							test.setProperty(index, "selected", true)
							test2.currentIndex = index
						}
					}
				}

				onCurrentIndexChanged: {
					configuration.device = "led#2"
					configuration.emitter = test.get(currentIndex).name
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

	function updateCorrection(l, r, g, b) {
		deviceCorrectorPage.update(l, r, g ,b);
	}

}
