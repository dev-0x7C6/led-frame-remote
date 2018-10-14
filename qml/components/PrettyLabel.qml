import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
	property string text
	property double min : 200
	property double factor : 3
	property int fontSize : 18
	property bool fontBold : true

	readonly property double widthFactor: label.contentWidth * factor


	Image {
		source: "qrc:/devices/title.png"
		anchors.centerIn: parent
		height: parent.height
		width: (parent.widthFactor > min) ? parent.widthFactor : min
		fillMode: Image.Stretch
		opacity: parent.opacity * 0.5
	}

	Label {
		id: label
		anchors.centerIn: parent
		fontSizeMode: Text.Fit
		elide: Text.ElideRight
		font.bold: fontBold
		font.pointSize: fontSize
		text: parent.text
		verticalAlignment: Text.AlignVCenter
	}
}
