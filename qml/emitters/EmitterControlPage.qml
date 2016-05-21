import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."
import "../components"

Item {
	Column {
		spacing: 5
		anchors.centerIn: parent

		DisplayIcon {

		}


//			Image {
//				id: bug
//				source: "qrc:/lcd256-without-glow.png"
//				sourceSize: Qt.size(parent.width, parent.height)
//				smooth: true
//				visible: false
//			}

//			GaussianBlur {
//				anchors.fill: bug
//				source: bug
//				radius: 16
//				samples: 32
//			}



		Label {
			text: "Color emitter"
			color: "white"
			width: parent.width
			horizontalAlignment: Qt.AlignHCenter
			font.bold: true
			font.pixelSize: 16
		}

		CustomSliderStyle {
			id: redSlider
			width: parent.width * 0.9
			value: 1.0
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "tomato"
			handleColor: "tomato"
			handleBorderColor: "black"
		}

		CustomSliderStyle {
			id: greenSlider
			width: parent.width * 0.9
			value: 1.0
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightGreen"
			handleColor: "lightGreen"
			handleBorderColor: "black"
		}

		CustomSliderStyle {
			id: blueSlider
			width: parent.width * 0.9
			value: 1.0
			anchors.horizontalCenter: parent.horizontalCenter
			sliderColor: "lightBlue"
			handleColor: "lightBlue"
			handleBorderColor: "black"
		}
	}
}
