import QtQuick 2.6

Item {
	property string device: "led#2";
	property string emitter: ""
	property double brightness : 0.5
	property double redCorrection : 0.5
	property double greenCorrection : 0.5
	property double blueCorrection: 0.5
	property bool disableUpdate : false

	onBrightnessChanged: changeCorrection()
	onRedCorrectionChanged: changeCorrection()
	onGreenCorrectionChanged: changeCorrection()
	onBlueCorrectionChanged: changeCorrection()
	onEmitterChanged: changeEmitter()

	function changeCorrection() {
		if (disableUpdate)
			return

		var command = {
			'command' : 'set_correction',
			'l' : brightness,
			'r' : redCorrection,
			'g' : greenCorrection,
			'b' : blueCorrection
		}
		commit(command)
	}

	function changeEmitter() {
		if (disableUpdate)
			return

		var command = {
			'command' : 'set_emitter',
			'device' : device,
			'emitter' : emitter
		}
		commit(command)
	}

	function commit(arg) {
	}
}
