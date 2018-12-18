import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

import "../components"

DefaultRectangle  {
	id: item

	readonly property color firstLabelColor: "orange"
	readonly property color secondLabelColor: "#808080"
	readonly property color thirdLabelColor: "#606060"

	readonly property double largeFont: 18
	readonly property double mediumFont: 12
	readonly property double smallFont: 10
}
