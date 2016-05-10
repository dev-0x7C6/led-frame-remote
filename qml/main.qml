import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0

ApplicationWindow {
	id: window
	width: 360
	height: 520
	visible: true


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

	}

	function broadcastClientAdded(arg) {
		mainStackView.push(deviceListPage);
		deviceListPage.insert(arg)
	}
}
