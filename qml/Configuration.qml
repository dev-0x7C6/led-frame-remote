import QtQuick 2.6
import QtQml.Models 2.2

Item {
	property int device: -1;
	property string emitter: ""
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

	function fetch(arg) {
		var json = JSON.parse(arg)

		console.log(JSON.stringify(json))
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

		if (json.corrector_owner === device && json.command === "corrector_attached") correctorAttached(json)
		if (json.corrector_owner === device && json.command === "corrector_detached") correctorDetached(json)
		if (json.corrector_owner === device && json.command === "corrector_motified") correctorMotified(json)
		if (json.command === "receiver_attached") receiverAttached(json)
		if (json.command === "receiver_detached") receiverDetached(json)
		if (json.command === "receiver_motified") receiverMotified(json)
		if (json.command === "emitter_attached") emitterAttached(json)
		if (json.command === "emitter_detached") emitterDetached(json)
		if (json.command === "emitter_motified") emitterMotified(json)

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

	function changeCorrector(id, factor) {
		var command = {
			'command' : 'set_corrector',
			'device' : device,
			'id' : id,
			'factor' : factor
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
