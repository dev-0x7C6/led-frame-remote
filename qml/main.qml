import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtWebSockets 1.0
import QtGraphicalEffects 1.0

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
				"parameters": arg.parameters,
				"selected": false
			}
			emitterModel.append(values)
		}

		function emitterDetached(arg) {
		}

		function recv(arg) {
			fetch(arg)
			deviceControlPage.update();
		}
	}

	toolBar: BorderImage {
		border.bottom: 8
		source: "qrc:/images/toolbar.png"
		width: parent.width
		height: 80

		Rectangle {
			id: backButton
			width: opacity ? image.width : 0
			anchors.left: parent.left
			anchors.leftMargin: 20
			opacity: mainStackView.depth > 2 ? 1 : 0
			anchors.verticalCenter: parent.verticalCenter
			antialiasing: true
			height: 60
			radius: 4
			color: backmouse.pressed ? "#222" : "transparent"
			Behavior on opacity { NumberAnimation{} }
			Image {
				id: image
				anchors.verticalCenter: parent.verticalCenter
				source: "qrc:/images/navigation_previous_item.png"
			}
			MouseArea {
				id: backmouse
				anchors.fill: parent
				anchors.margins: -10
				onClicked: {
					webSocket.url = ""
					mainStackView.pop(deviceListPage)
				}
			}
		}

		Text {
			id: title
			font.bold: true
			font.pixelSize: 28
			Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
			Behavior on font.pixelSize { NumberAnimation{ easing.type: Easing.OutCubic} }
			x: backButton.x + backButton.width + 20
			anchors.verticalCenter: parent.verticalCenter
			color: "white"
			text: ""
		}

		Text {
			id: subtitle
			font.bold: true
			font.pixelSize: 12
			opacity: visible ? 1.0 : 0.0
			Behavior on opacity { NumberAnimation{ easing.type: Easing.OutCubic} }
			Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
			Behavior on font.pixelSize { NumberAnimation{ easing.type: Easing.OutCubic} }
			x: backButton.x + backButton.width + 20
			anchors.top: title.bottom
			color: "orange"
			text: ""
		}
	}

	StackView {
		id: mainStackView
		anchors.fill: parent
		initialItem: deviceWaitPage

		DeviceWaitPage {
			id: deviceWaitPage
		}

		DeviceListPage {
			id: deviceListPage
			visible: false
		}

		DeviceControlPage {
			id: deviceControlPage
			visible: false
		}

		onCurrentItemChanged: {
			if (currentItem == deviceListPage) {
				title.text = "Devices"
				title.font.pixelSize = 20
			}

			if (currentItem == deviceControlPage) {
				title.text = "Control Panel: " + configuration.device
				title.font.pixelSize = 20
			}

			if (currentItem == deviceWaitPage) {
				title.text = "Searching..."
				title.font.pixelSize = 20
			}

			if (currentItem == deviceListPage) {
				if (webSocket.status == WebSocket.Open)
					webSocket.active = false;
			}
		}

	}

	function broadcastClientAdded(arg) {
		if (mainStackView.currentItem == deviceWaitPage)
			mainStackView.push(deviceListPage)
		deviceListPage.insert(arg)
	}
}
