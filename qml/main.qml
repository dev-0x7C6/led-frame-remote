import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0
import Qt.labs.controls.universal 1.0
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
	id: window
	width: 360
	height: 520
	visible: true

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
