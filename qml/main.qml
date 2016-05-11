import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0
import Qt.labs.controls.universal 1.0
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import QtWebSockets 1.0

ApplicationWindow {
	id: window
	width: 360
	height: 520
	visible: true

	WebSocket {
		id: webSocketClient

		onTextMessageReceived: {
		}

		onStatusChanged:  {
			console.log(webSocketClient.status)
			if (webSocketClient.status == WebSocket.Error)
				mainStackView.pop(deviceListPage)

			if (webSocketClient.status == WebSocket.Open)
				mainStackView.push(deviceControlPage)
		}
	}

	Item {
		id: protocol

		property variant data : {
			'brightness': 0.5,
			'rcorrector': 0.5,
			'gcorrector': 0.5,
			'bcorrector': 0.5
		}

		function send() {
			webSocketClient.sendTextMessage(JSON.stringify(data))
		}
	}

	Settings {
		id: settings
		property string style: "Universal"
	}


	header: ToolBar {
		RowLayout {
			spacing: 20
			anchors.fill: parent

			Label {
				id: titleLabel
				text: "LedFrame Remote"
				font.pixelSize: 20
				elide: Label.ElideRight
				horizontalAlignment: Qt.AlignHCenter
				verticalAlignment: Qt.AlignVCenter
				Layout.fillWidth: true
			}

			ToolButton {
				label: Image {
					anchors.centerIn: parent
					source: "qrc:/menu.png"
				}
				onClicked: optionsMenu.open()

				Menu {
					id: optionsMenu
					x: parent.width - width
					transformOrigin: Menu.TopRight

					MenuItem {
						id: mainMenuShowDeviceList
						enabled: false
						text: "Device list"
						onTriggered: {
							mainStackView.pop(deviceListPage)

						}
					}

					MenuItem {
						id: mainMenuQuit
						text: "Quit"
						onTriggered: Qt.quit();
					}

				}

			}

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
			mainMenuShowDeviceList.enabled = (currentItem != deviceWaitPage && currentItem != deviceListPage)

			if (currentItem == deviceListPage) {
				if (webSocketClient.status == WebSocket.Open)
					webSocketClient.active = false;
			}
		}

	}

	function broadcastClientAdded(arg) {
		mainStackView.push(deviceListPage)
		deviceListPage.insert(arg)
	}
}
