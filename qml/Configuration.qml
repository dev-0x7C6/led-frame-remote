import QtQuick 2.6

Item {
	property string device: "none";
	property variant data : {
		'brightness': 0.5,
		'rcorrector': 0.5,
		'gcorrector': 0.5,
		'bcorrector': 0.5
	}

	function setBrightness(arg) {
		data.brightness = arg;
		send()
	}

	function setRedFactor(arg) {
		data.rcorrector = arg;
		send()
	}

	function setGreenFactor(arg) {
		data.gcorrector = arg;
		send()
	}

	function setBlueFactor(arg) {
		data.bcorrector = arg;
		send()
	}

	function send() {
	}
}
