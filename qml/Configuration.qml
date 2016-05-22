import QtQuick 2.6

Item {
	property string device: "led#2";
	property string emitter: ""
	property string corrector: ""
	property double globalBrightness : 0.5
	property double globalRedCorrection : 0.5
	property double globalGreenCorrection : 0.5
	property double globalBlueCorrection: 0.5
	property bool disableUpdate : false

	onGlobalBrightnessChanged: changeCorrection()
	onGlobalRedCorrectionChanged: changeCorrection()
	onGlobalGreenCorrectionChanged: changeCorrection()
	onGlobalBlueCorrectionChanged: changeCorrection()
	onEmitterChanged: changeEmitter()
	onCorrectorChanged: changeCorrector()

	function changeCorrection() {
		if (disableUpdate)
			return

		var command = {
			'command' : 'set_correction',
			'l' : globalBrightness,
			'r' : globalRedCorrection,
			'g' : globalGreenCorrection,
			'b' : globalBlueCorrection
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

	function changeCorrector() {
		if (disableUpdate)
			return

		var command = {
			'command' : 'set_corrector',
			'device' : device,
			'corrector' : corrector
		}

		commit(command)
	}

	function commit(arg) {
	}
}
