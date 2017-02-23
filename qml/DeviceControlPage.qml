import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3


import "emitters"
import "delegates"
import "../js/functions.js" as Logic

Item {
	id: canvas

	TabBar {
		id: tabBar
		width: parent.width
		currentIndex: view.currentIndex

		TabButton {
			text: qsTr("Emitters")
		}
		TabButton {
			text: qsTr("Correctors")
		}
		TabButton {
			text: qsTr("Output")
		}
	}

	SwipeView {
		id: view
		width: parent.width
		height: parent.height - tabBar.height
		anchors.top: tabBar.bottom
		currentIndex: tabBar.currentIndex
		z: parent.z -1

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
						configuration.selectedEmitter = JSON.stringify(datagram)
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
				height: configuration.device === datagram.owner ? 80 : 0
				width: parent.width
				iconSource: correctorIconFromType()
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

			Component.onCompleted: {
				correctorModel.updateItem.connect(select)
			}

			function select(arg) {
				console.log("test!")
			}
		}

		DeviceCorrectorPage {
			id: correction
		}
	}
}
