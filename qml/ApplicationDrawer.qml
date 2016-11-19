import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1

Drawer {
	id: applicationDrawer
	width: 0.66 * window.width
	height: window.height
	property bool isDevicePageActivated
	property bool isCorrectorPageActivated
	property var availableClientModel

	function onDevicePageClicked() {}
	function onCorrectorPageClicked() {}

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
			font.pointSize: 12
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
			Layout.preferredHeight: listView3.contentHeight

			ListView {
				id: listView3
				currentIndex: -1
				interactive: false
				Layout.fillWidth: true
				Layout.fillHeight: contentHeight

				delegate: ItemDelegate {
					width: parent.width
					text: " -> " + model.device + " on " + model.computer
					highlighted: ListView.isCurrentItem
					onClicked: {
						if (listView.currentIndex != index) {
							listView.currentIndex = index
							titleLabel.text = model.title
							stackView.replace(model.source)
						}
						applicationDrawer.close()
					}
				}

				model: availableClientModel

				ScrollIndicator.vertical: ScrollIndicator { }
			}
		}

		ItemDelegate {
			Layout.fillWidth: true
			font.pointSize: 12
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
