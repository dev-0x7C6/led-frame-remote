import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0

ApplicationWindow {
	id: window
	width: 360
	height: 520
	visible: true
	title: "Qt Labs Controls"


	header: ToolBar {
		RowLayout {
			spacing: 20
			anchors.fill: parent

			ToolButton {
				label: Image {
					anchors.centerIn: parent
					source: "qrc:/drawer.png"
				}
				onClicked: drawer.open()
			}

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
						text: "Replace"
						onTriggered: stackView.replace("qrc:/ConnectedDevice.qml")
					}

				}
			}
		}
	}

	ListModel {
		id: broadcastClientList
	}

	ListView {
		id: broadcastClientView
		anchors.fill: parent
		clip: true
		model: broadcastClientList
		delegate: ConnectionDelegate {}
	}

	StackView {
		id: defaultView
		anchors.fill: parent
		initialItem: "qrc:/wait-for-connection.qml"
	}

	function broadcastClientAdded(arg) {
		defaultView.visible = false
		broadcastClientList.insert(0, arg)
	}
}
