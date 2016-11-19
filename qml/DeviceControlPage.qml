import QtQuick 2.8
import QtQuick.Controls 2.1

import "emitters"
import "delegates"
import "../js/functions.js" as Logic

Item {
	id: canvas

	SwipeView {
		id: view
		anchors.fill: parent

		ListView {
			id: emitterListView
			model: emitterModel
			currentIndex: -1

			delegate: EmitterDelegate {
				id: delegate
				width: parent.width
				implicitHeight: 100
				iconSource: Logic.emitterIconFromType(datagram.type)
				iconRotation: emitterListView.currentIndex === index && datagram.type === "animation"
				color: emitterListView.currentIndex === index ? sg : bg
				opacity: emitterListView.currentIndex === index ? 1.0 : 0.4

				MouseArea {
					anchors.fill: parent
					onClicked: {
						emitterListView.currentIndex = index
						configuration.emitter = emitterModel.get(index).datagram.id
					}
				}
			}

			Component.onCompleted: {
				emitterModel.selectEmitter.connect(select)
			}

			function select(arg) {
				emitterListView.currentIndex = arg
			}

			ScrollIndicator.vertical: ScrollIndicator { }
		}

		ListView {
			id: correctorListView
			model: correctorModel
			currentIndex: -1

			delegate: CorrectorDelegate {
				value: datagram.factor
				min: datagram.min
				max: datagram.max
				height: configuration.device === datagram.owner ? 100 : 0
				width: parent.width
				implicitHeight: 100
				iconSource: "qrc:/color.png"
				iconRotation: true
				color: bg
				opacity: (value > datagram.min) ? 1.0 : 0.3
				Behavior on opacity { NumberAnimation{} }
				visible: configuration.device === datagram.owner
				onValueChanged: {
					configuration.changeCorrector(datagram.id, value, value > datagram.min)
				}
			}
			ScrollIndicator.vertical: ScrollIndicator { }
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
