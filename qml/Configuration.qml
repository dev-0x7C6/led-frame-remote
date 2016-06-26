import QtQuick 2.6
import QtQml.Models 2.2

Item {
	property string device: "";
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

	function fetch(arg) {
		var json = JSON.parse(arg)

		disableUpdate = true

		if (json.command === "receiver_modified") {
			console.log(JSON.stringify(json));
			for (var i = 0; i < emitterModel.count; ++i)
				if (emitterModel.get(i).name  === json.connected)
					emitterModel.selectEmitter(i)
		}

		if (json.command === "set_global_correction") {
			globalBrightness = json.l
			globalRedCorrection = json.r
			globalGreenCorrection = json.g
			globalBlueCorrection = json.b
		}

		if (json.command === "emitter_attached")
			emitterAttached(json)

		if (json.command === "emitter_detached")
			emitterDetached(json)

		disableUpdate = false
	}

	function changeCorrection() {
		var command = {
			'command' : 'set_correction',
			'l' : globalBrightness,
			'r' : globalRedCorrection,
			'g' : globalGreenCorrection,
			'b' : globalBlueCorrection
		}
		precommit(command)
	}

	function changeEmitter() {
		var command = {
			'command' : 'set_emitter',
			'device' : device,
			'emitter' : emitter
		}

		precommit(command)
	}

	function changeCorrector() {
		var command = {
			'command' : 'set_corrector',
			'device' : device,
			'corrector' : corrector
		}

		precommit(command)
	}

	function precommit(command) {
		if (disableUpdate)
			return

		commit(command)
	}

	function emitterAttached(arg) {}
	function emitterDetached(arg) {}

	function commit(command) {}
}
