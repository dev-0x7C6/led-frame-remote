import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtWebSockets 1.0
import QtGraphicalEffects 1.0

import "components"

ApplicationWindow {
	id: window
	height: 520
	width: 360
	visible: true

	Rectangle {
		color: Qt.darker("#101020", 2)
		anchors.fill: parent
	}

	WebSocket {
		id: webSocket

		onTextMessageReceived: configuration.recv(message)

		onStatusChanged: {
			if (webSocket.status == WebSocket.Error) {
				mainStackView.pop(deviceListPage)
				url = ""
			}

			if (webSocket.status == WebSocket.Open) {
				mainStackView.push(deviceControlPage)
				emitterModel.clear()
				correctorModel.clear()
			}
		}
	}

	ListModel {
		id: emitterModel
		signal selectEmitter(int index)
	}

	ListModel {
		id: correctorModel
	}


	Configuration {
		id: configuration

		function commit(command) {
			if (webSocket.status == WebSocket.Open)
				webSocket.sendTextMessage(JSON.stringify(command))
		}

		function correctorAttached(arg) {
			correctorModel.append(arg)

			if (arg.datagram.owner !== -1)
				return;

			switch (arg.datagram.type) {
				case "brightness":
					globalLValue = arg.datagram.factor;
					globalLId = arg.datagram.id;
					break;
				case "red_channel":
					globalRValue = arg.datagram.factor;
					globalRId = arg.datagram.id;
					break;
				case "green_channel":
					globalGValue = arg.datagram.factor;
					globalGId = arg.datagram.id;
					break;
				case "blue_channel":
					globalBValue = arg.datagram.factor;
					globalBId = arg.datagram.id;
					break;
			}
		}

		function correctorModified(arg) {
			for (var i = 0; i < correctorModel.count; ++i)
				if (correctorModel.get(i).datagram.id  === arg.datagram.id)
					correctorModel.set(i, arg)

			if (arg.datagram.owner !== -1)
				return;

			switch (arg.datagram.type) {
				case "brightness":
					globalLValue = arg.datagram.factor;
					globalLId = arg.datagram.id;
					break;
				case "red_channel":
					globalRValue = arg.datagram.factor;
					globalRId = arg.datagram.id;
					break;
				case "green_channel":
					globalGValue = arg.datagram.factor;
					globalGId = arg.datagram.id;
					break;
				case "blue_channel":
					globalBValue = arg.datagram.factor;
					globalBId = arg.datagram.id;
					break;
			}
		}

		function emitterAttached(arg) {
			emitterModel.append(arg)
			for (var i = 0; i < emitterModel.count; ++i)
				if (emitterModel.get(i).datagram.id  === configuration.emitter)
					emitterModel.selectEmitter(i)
		}

		function receiverAttached(arg) {
			emitter = arg.datagram.emitter;
			for (var i = 0; i < emitterModel.count; ++i)
				if (emitterModel.get(i).datagram.id  === configuration.emitter)
					emitterModel.selectEmitter(i)
		}

		function receiverModified(arg) {
			emitter = arg.datagram.emitter;
			for (var i = 0; i < emitterModel.count; ++i)
				if (emitterModel.get(i).datagram.id  === configuration.emitter)
					emitterModel.selectEmitter(i)
		}

		function emitterDetached(arg) {}

		function recv(arg) {
			fetch(arg)
		}
	}

	toolBar: BorderImage {
		border.bottom: 8
		source: "qrc:/images/toolbar.png"
		width: parent.width
		height: 80

		RowLayout {
			anchors.fill: parent
			anchors.leftMargin: 20
			anchors.rightMargin: 20
			spacing: 10

			MenuButton {
				opacity: mainStackView.depth > 2 ? 1 : 0
				visible: opacity != 0
				source: "qrc:/images/navigation_previous_item.png"

				MouseArea {
					anchors.fill: parent
					onClicked: {
						if (mainStackView.depth > 2)
							mainStackView.pop(-1);
					}
				}
			}

			Item {
				id: main
				Layout.fillWidth: true
				Layout.fillHeight: true

				ColumnLayout {
					anchors.fill: parent
					anchors.topMargin: 20
					anchors.bottomMargin: 20

					DefaultLabel {
						Layout.fillWidth: true
						Layout.minimumWidth: 0
						minimumPointSize: 16
						id: title
						font.bold: true

						color: "white"
						text: ""
					}

					DefaultLabel {
						Layout.fillWidth: true
						Layout.minimumWidth: 0
						id: subtitle
						visible: configuration.device.length != 0
						font.bold: true
						color: "orange"
						text: configuration.device
					}
				}
			}

			MenuButton {
				opacity: webSocket.status == WebSocket.Open ? 1 : 0
				visible: opacity != 0
				source: "qrc:/config.png"

				MouseArea {
					anchors.fill: parent
					onClicked: mainStackView.push(correctorPage);
				}
			}
		}
	}

	StackView {
		id: mainStackView
		anchors.fill: parent

		initialItem: DeviceWaitPage {
			id: deviceWaitPage
			text: "Searching for devices..."
		}

		DeviceListPage {
			id: deviceListPage
			visible: false
		}

		Component {
			id: deviceControlPage
			DeviceControlPage {}
		}

		Component {
			id: correctorPage
			DeviceCorrectorPage {}
		}


		onCurrentItemChanged: {
			if (currentItem == deviceListPage) title.text = "Devices"
			if (currentItem == deviceWaitPage) title.text = "Searching..."
			if (currentItem == correctorPage) title.text = "Correction"

			if (currentItem == deviceListPage) {
				if (webSocket.status == WebSocket.Open)
					webSocket.active = false;
			}
		}

		delegate: StackViewDelegate {
			   function transitionFinished(properties)
			   {
				   properties.exitItem.opacity = 1
			   }

			   pushTransition: StackViewTransition {
				   PropertyAnimation {
					   target: enterItem
					   property: "opacity"
					   from: 0
					   to: 1
				   }
				   PropertyAnimation {
					   target: exitItem
					   property: "opacity"
					   from: 1
					   to: 0
				   }
			   }
		   }
	}

	Connections {
		target: broadcast

		onDeviceDetected: {
			if (mainStackView.currentItem == deviceWaitPage)
				mainStackView.push(deviceListPage)
			deviceListPage.insert(arg)
		}
	}
}
