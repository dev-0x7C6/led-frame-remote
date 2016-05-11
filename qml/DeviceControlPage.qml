import Qt.labs.controls 1.0
import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtWebSockets 1.0

Item {
	anchors.fill: parent

	property string hostName
	property int hostPort


	WebSocket {
		id: webSocketClient

		onTextMessageReceived: {
		}

		onStatusChanged:  {
			console.log(webSocketClient.status)
			if (webSocketClient.status == WebSocket.Error) {
				webSocketClient.active = false
				mainStackView.pop(deviceListPage)
			}

			if (webSocketClient.status == WebSocket.Open)
				mainStackView.push(deviceControlPage)

			console.log(webSocketClient.errorString)
		}
		active: true
	}


	SwipeView {
		id: view

		currentIndex: 0
		anchors.fill: parent

		DeviceCorrectorPage {
			id: st
		}

	}

	PageIndicator {
		id: indicator

		count: view.count
		currentIndex: view.currentIndex

		anchors.bottom: view.bottom
		anchors.horizontalCenter: parent.horizontalCenter
	}

	function updateSocketConfiguration() {
		var address = "ws://"
		webSocketClient.url = address.concat(hostName, ":", hostPort)
		webSocketClient.active = true
	}

}
