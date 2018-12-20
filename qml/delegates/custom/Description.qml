import QtQuick 2.12
import QtQuick.Layouts 1.12

import "../../components/labels"
import "../../components/layouts"

ColumnLayout {
	property string name;
	property string detail;
	property string description;

	spacing: 0

	LayoutExpander {}

	LargeLabel { text: name; }
	MediumLabel { text: detail; }
	SmallLabel { text: description; }

	LayoutExpander {}
}
