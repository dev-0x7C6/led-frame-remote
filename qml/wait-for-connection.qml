import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
	anchors.centerIn: parent

	ColumnLayout {
		anchors.centerIn: parent

		BusyIndicator {
			anchors.horizontalCenter: waitingLabel.horizontalCenter
			running: image.status === Image.Loading
		}

		Label {
			id: waitingLabel
			text: "Waiting for devices...";
		}
	}
}
