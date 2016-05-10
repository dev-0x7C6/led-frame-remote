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
						onTriggered: mainStackView.pop(deviceListPage)
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
		}

	}

	function broadcastClientAdded(arg) {
		mainStackView.push(deviceListPage)
		deviceListPage.insert(arg)
	}
}
