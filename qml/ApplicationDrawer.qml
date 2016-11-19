import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Drawer {
	id: applicationDrawer
	width: 0.66 * window.width
	height: window.height
	property bool isDevicePageActivated
	property bool isCorrectorPageActivated
	property var availableClientModel

	function onDevicePageClicked() {}
	function onCorrectorPageClicked() {}
	function onClientSelected(host, port, id) {}

	Material.background: "#101020"

	ColumnLayout {
		anchors.fill: parent

		BorderImage {
			Layout.fillWidth: true
			Layout.preferredHeight: 80
			border.bottom: 8
			source: "qrc:/images/toolbar.png"
		}

		ItemDelegate {
			Layout.fillWidth: true
			font.pixelSize: 22
			font.bold: true
			text: "Devices"
			enabled: applicationDrawer.isDevicePageActivated
			onClicked: {
				onDevicePageClicked()
				applicationDrawer.close()
			}
		}

		ColumnLayout {
			Layout.fillWidth: true
			Layout.preferredHeight: list.contentHeight

			ListView {
				id: list
				currentIndex: -1
				interactive: false
				Layout.fillWidth: true
				Layout.fillHeight: contentHeight

				delegate: ItemDelegate {
					width: parent.width
					font.pixelSize: 16
					text: " -> " + model.device + " on " + model.computer
					highlighted: ListView.isCurrentItem
					onClicked: {
						onClientSelected(model.host, model.port, model.id)
						applicationDrawer.close()
					}
				}

				model: availableClientModel

				ScrollIndicator.vertical: ScrollIndicator { }
			}
		}

		ItemDelegate {
			Layout.fillWidth: true
			font.pixelSize: 22
			font.bold: true
			text: "Correction"
			enabled: applicationDrawer.isCorrectorPageActivated

			onClicked: {
				onCorrectorPageClicked()
				applicationDrawer.close()
			}
		}

		Item {
			Layout.fillHeight: true
		}
	}

}
