package jsfps.simplefps;

import js.Browser;

class Fps {

	var _last:Float;
	var _time:Float;
	var _decay:Float;
	var _every:Float;
	var _ticks:Int;
	var _callback:Float -> Void;

	public var rate(default, null):Float;

	public function new(?callback:Float -> Void, ?every:Float = 60, ?decay:Float = 1) {
		_callback = callback;
		rate = 60;
		_time = 0;
		_decay = decay;
		_every = every;
		_ticks = 0;
		_last = _now();
	}

	function _now():Float {
		if (Browser.window.performance != null) return Browser.window.performance.now();
		return Date.now().getTime();
	}

	public function tick() {
		var time = _now();
		var diff = time - _last;

		_ticks += 1;
		_last = time;
		_time += (diff - _time) * _decay;
		rate = Math.round(1000 / _time);
		if (rate > 60) rate = 60;

		if (_ticks % _every == 0 && _callback != null) _callback(rate);
	}
}