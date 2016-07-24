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
					if (arg === "Animation")
						return "qrc:/animation.png"

					if (arg === "Screen capture")
						return "qrc:/desktop.png"

					if (arg === "Image")
						return "qrc:/image.png"

					return "qrc:/color.png"
				}

				id: delegate
				width: parent.width
				implicitHeight: 80
				iconSource: iconFromType(description)
				iconRotation: emitterListView.currentIndex === index && description == "Animation"
				color: emitterListView.currentIndex === index ? sg : bg
				opacity: emitterListView.currentIndex === index ? 1.0 : 0.4


				MouseArea {
					anchors.fill: parent
					onClicked: {
						emitterListView.currentIndex = index
						configuration.emitter = emitterModel.get(index).name
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
				id: delegate
				min: minimumFactor
				max: maximumFactor
				value: factor
				width: parent.width
				implicitHeight: 180
				iconSource: "qrc:/color.png"
				iconRotation: true
				color: bg
				opacity: 1.0
				onValueChanged: {
					configuration.changeCorrector(type, value)
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
