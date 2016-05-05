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
		id:dupak
	}


	ListView {
		anchors.fill: parent
		clip: true
		model: dupak
		delegate: ConnectionDelegate {}
	}


	StackView {
		id: defaultView
		anchors.fill: parent
		initialItem: "qrc:/wait-for-connection.qml"
	}

	function deviceConnected() {
		defaultView.replace("")
		dupak.insert(0, {name: "alfa"})
	}
}
