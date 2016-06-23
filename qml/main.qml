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
			}
		}
	}

	ListModel {
		id: emitterModel
		signal selectEmitter(int index)
	}


	Configuration {
		id: configuration

		function commit(command) {
			if (webSocket.status == WebSocket.Open)
				webSocket.sendTextMessage(JSON.stringify(command))
		}

		function emitterAttached(arg) {
			var values = {
				"name": arg.name,
				"description": arg.description,
				"parameters": arg.parameters
			}

			emitterModel.append(values)

			for (var i = 0; i < emitterModel.count; ++i)
				if (emitterModel.get(i).name  === configuration.emitter)
					emitterModel.selectEmitter(i)
		}

		function emitterDetached(arg) {
		}

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
					onClicked: mainStackView.pop(-1);
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
