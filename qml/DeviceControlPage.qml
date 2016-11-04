import QtQuick 2.6
import QtQuick.Controls 2.0

import "emitters"
import "delegates"

Item {
	id: canvas

	SwipeView {
		anchors.fill: parent

		ListView {
			id: emitterListView
			model: emitterModel
			currentIndex: -1

			delegate: EmitterDelegate {
				function iconFromType(arg) {
					if (arg === "animation")
						return "qrc:/animation.png"

					if (arg === "display")
						return "qrc:/desktop.png"

					if (arg === "image")
						return "qrc:/image.png"

					return "qrc:/color.png"
				}

				id: delegate
				width: parent.width
				implicitHeight: 100
				iconSource: iconFromType(datagram.type)
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

			focus: true
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
				opacity: 1.0
				visible: configuration.device === datagram.owner
				onValueChanged: {
					configuration.changeCorrector(datagram.id, value, value > datagram.min)
				}
			}

			Component.onCompleted: {
				emitterModel.selectEmitter.connect(select)
			}

			function select(arg) {
				emitterListView.currentIndex = arg
			}

			focus: true
		}

	}
}
