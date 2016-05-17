import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtWebSockets 1.0


ApplicationWindow {
	id: window
	width: 360
	height: 520
	visible: true

	Rectangle {
		color: "#111111"
		anchors.fill: parent
	}

	WebSocket {
		id: webSocketClient

		property string device: "none"

		onTextMessageReceived: configuration.recv(message)

		onStatusChanged:  {
			console.log(webSocketClient.status)
			if (webSocketClient.status == WebSocket.Error)
				mainStackView.pop(deviceListPage)

			if (webSocketClient.status == WebSocket.Open)
				mainStackView.push(deviceControlPage)
		}

		onActiveChanged: {
			console.log("active: " + active)
		}
	}

	LedFrameConfiguration {
		id: configuration


		function setBrightness(arg) {
			data.brightness = arg;
			send()
		}

		function setRedFactor(arg) {
			data.rcorrector = arg;
			send()
		}

		function setGreenFactor(arg) {
			data.gcorrector = arg;
			send()
		}

		function setBlueFactor(arg) {
			data.bcorrector = arg;
			send()
		}

		function send() {
			if (webSocketClient.status == WebSocket.Open)
				webSocketClient.sendTextMessage(JSON.stringify(data))
		}

		function recv(arg) {
			data = JSON.parse(arg)
			deviceControlPage.configurationUpdated();
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
					webSocketClient.url = ""
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
			property bool r: false
			anchors.verticalCenter: parent.verticalCenter
			color: "white"
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
				title.text = "Control Panel: " + webSocketClient.device
				title.font.pixelSize = 20
			}

			if (currentItem == deviceWaitPage) {
				title.text = "Searching..."
				title.font.pixelSize = 20
			}

			if (currentItem == deviceListPage) {
				if (webSocketClient.status == WebSocket.Open)
					webSocketClient.active = false;
			}
		}

	}

	function broadcastClientAdded(arg) {
		if (mainStackView.currentItem == deviceWaitPage)
			mainStackView.push(deviceListPage)
		deviceListPage.insert(arg)
	}
}
