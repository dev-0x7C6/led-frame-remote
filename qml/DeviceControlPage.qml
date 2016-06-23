import QtQuick 2.6
import QtQuick.Controls 2.0

import "emitters"
import "delegates"

Item {
	id: canvas

	ListView {
		id: emitterListView
		anchors.fill: parent
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
}
