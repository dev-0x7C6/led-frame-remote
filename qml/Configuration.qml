import QtQuick 2.6
import QtQml.Models 2.2

Item {
	property int device: -1;
	property string name: "";
	property int emitter: -1;
	property double globalBrightness : 0.5
	property double globalRedCorrection : 0.5
	property double globalGreenCorrection : 0.5
	property double globalBlueCorrection: 0.5
	property bool disableUpdate : false

	onGlobalBrightnessChanged: changeCorrection()
	onGlobalRedCorrectionChanged: changeCorrection()
	onGlobalGreenCorrectionChanged: changeCorrection()
	onGlobalBlueCorrectionChanged: changeCorrection()
	onEmitterChanged: setEmitter()

	function fetch(arg) {
		var json = JSON.parse(arg)

		console.log(JSON.stringify(json))
		disableUpdate = true

		if (json.command === "set_global_correction") {
			globalBrightness = json.l
			globalRedCorrection = json.r
			globalGreenCorrection = json.g
			globalBlueCorrection = json.b
		}

		if (json.message === "notification" && json.source === "emitter") {
			switch (json.event) {
			case "attached": emitterAttached(json); break;
			case "detached": emitterDetached(json); break;
			case "modified": emitterModified(json); break;
			}
		}

		if (json.message === "notification" && json.source === "corrector") {
			switch (json.event) {
			case "attached": correctorAttached(json); break;
			case "detached": correctorDetached(json); break;
			case "modified": correctorModified(json); break;
			}
		}

		if (json.message === "notification" && json.source === "receiver") {
			switch (json.event) {
			case "attached": receiverAttached(json); break;
			case "detached": receiverDetached(json); break;
			case "modified": receiverModified(json); break;
			}
		}

		//		if (json.command === "receiver_modified") {
		//			console.log(JSON.stringify(json));
		//			for (var i = 0; i < emitterModel.count; ++i)
		//				if (emitterModel.get(i).name  === json.connected)
		//					emitterModel.selectEmitter(i)
		//		}

		disableUpdate = false
	}

	function setEmitter() {
		var json = {
			'message' : 'command',
			'version' : '1',
			'event' : 'set_emitter',
			'receiver' : device,
			'emitter' : emitter,
		}
		precommit(json)
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
	function emitterModified(arg) {}
	function correctorAttached(arg) {}
	function correctorDetached(arg) {}
	function correctorModified(arg) {}
	function receiverAttached(arg) {}
	function receiverDetached(arg) {}
	function receiverModified(arg) {}

	function commit(command) {}
}
