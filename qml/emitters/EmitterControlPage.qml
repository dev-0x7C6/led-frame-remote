import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."
import "../components"

Item {
	Column {
		//		spacing: 10
		//		anchors.topMargin: 10
		//		width: parent.width

		DisplayIcon {
			id: icon
			//source: "qrc:/device.png"
			borderRadius: 8
			height: parent.height;
			width: parent.height
		}

		Label {
			text: "Color emitter"
			color: "white"
			width: parent.width
			horizontalAlignment: Qt.AlignHCenter
			font.bold: true
			font.pixelSize: 16
		}

		Slider {
			id: redSlider
			width: parent.width * 0.9
			value: 1.0
			anchors.horizontalCenter: parent.horizontalCenter
			color: "tomato"
		}

		Slider {
			id: greenSlider
			width: parent.width * 0.9
			value: 1.0
			anchors.horizontalCenter: parent.horizontalCenter
			color: "lightGreen"
		}

		Slider {
			id: blueSlider
			width: parent.width * 0.9
			value: 1.0
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}
}
