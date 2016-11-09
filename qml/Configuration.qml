import QtQuick 2.6
import QtQml.Models 2.2

Item {
	property int device: -1;
	property string name: "";
	property int emitter: -1;

	property double globalLValue: 0.0
	property double globalRValue: 0.0
	property double globalGValue: 0.0
	property double globalBValue: 0.0
	property int globalLId: -1
	property int globalRId: -1
	property int globalGId: -1
	property int globalBId: -1

	property bool disableUpdate : false

	onGlobalLValueChanged: changeCorrector(globalLId, globalLValue, true);
	onGlobalRValueChanged: changeCorrector(globalRId, globalRValue, true);
	onGlobalGValueChanged: changeCorrector(globalGId, globalGValue, true);
	onGlobalBValueChanged: changeCorrector(globalBId, globalBValue, true);
	onEmitterChanged: setEmitter()

	function fetch(arg) {
		var json = JSON.parse(arg)

		console.log(JSON.stringify(json))
		disableUpdate = true

		if (json.message === "notification") {
			if (json.source === "emitter") {
				switch (json.event) {
				case "attached": emitterAttached(json); break;
				case "detached": emitterDetached(json); break;
				case "modified": emitterModified(json); break;
				}
			}

			if (json.source === "corrector") {
				switch (json.event) {
				case "attached": correctorAttached(json); break;
				case "detached": correctorDetached(json); break;
				case "modified": correctorModified(json); break;
				}
			}

			if (json.source === "receiver") {
				switch (json.event) {
				case "attached": receiverAttached(json); break;
				case "detached": receiverDetached(json); break;
				case "modified": receiverModified(json); break;
				}
			}
		}

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

	function changeCorrector(id, factor, enabled) {
		var json = {
			'message' : 'command',
			'version' : '1',
			'event' : 'set_corrector',
			'receiver' : device,
			'corrector' : id,
			'factor' : factor,
			'enabled' : enabled,
		}
		precommit(json)
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
