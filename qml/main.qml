import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

import QtQuick.Layouts 1.3
import QtWebSockets 1.0
import QtGraphicalEffects 1.0

import "components"

ApplicationWindow {
	id: window
	height: 520
	width: 360
	visible: true

	Material.background: Qt.darker("#101020", 2)


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
		id: broadcastClientList
		property bool progressVisible : false
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

		function correctorMoemitterModeldified(arg) {
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

	ApplicationDrawer {
		id: applicationDrawer
		isCorrectorPageActivated: broadcastClientList.count !== 0 && webSocket.status === WebSocket.Open
		isDevicePageActivated: broadcastClientList.count !== 0
		availableClientModel: broadcastClientList

		function onDevicePageClicked() {
			console.log(mainStackView.depth)
			if (mainStackView.currentItem !== deviceListPage)
				mainStackView.push(deviceListPage)
		}

		function onCorrectorPageClicked() {
			if (mainStackView.currentItem !== correctorPage)
				mainStackView.push(correctorPage)
		}
	}

	header: ApplicationHeader {
		id: applicationHeader
	}

	StackView {
		id: mainStackView
		anchors.fill: parent

		initialItem: WaitPage {
			id: waitingForConnectionPage
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
			if (currentItem == deviceListPage) applicationHeader.title = "Devices"
			if (currentItem == waitingForConnectionPage) applicationHeader.title = "Searching..."
			if (currentItem == correctorPage) applicationHeader.title = "Correction"

			if (currentItem == deviceListPage) {
				if (webSocket.status == WebSocket.Open)
					webSocket.active = false;
			}
		}
	}

	Connections {
		target: broadcast

		onDeviceDetected: {
			if (mainStackView.currentItem == waitingForConnectionPage)
				mainStackView.push(deviceListPage)
			deviceListPage.insert(arg)
		}
	}
}
