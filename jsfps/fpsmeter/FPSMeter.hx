package jsfps.fpsmeter;

import js.html.Element;

@:native("FPSMeter")
extern class FPSMeter {

	function new(?anchor:Element, ?options:Options);

	/**
	 * Marks the end of each frame. This is the method that measures everything.
	 */
	function tick():Void;

	/**
	 * Marks the beginning of each frame. .tick() than uses this time to measure the rendering duration of each frame.
	 * This method is optional, and if omitted, .tick() will measure the duration between frames instead.
	 */
	function tickStart():Void;

	/**
	 * Changes the meter to display FPS.
	 */
	function showFps():Void;

	/**
	 * Changes the meter to display duration between frames, or frame rendering duration when using .tickStart() method.
	 */
	function showDuration():Void;

	/**
	 * Toggles between showFps amd showDuration.
	 */
	function toggle():Void;

	/**
	 * Pauses the meter rendering. FPSMeter still continues to measure everything, just the meter element rendering is paused.
	 */
	function pause():Void;

	/**
	 * Resumes the paused rendering.
	 */
	function resume():Void;

	/**
	 * Pauses the rendering, and hides the FPSMeter element.
	 */
	function hide():Void;

	/**
	 * Shows the FPSMeter element, and resumes the rendering.
	 */
	function show():Void;

	/**
	 * Updates an option value, and when needed, repositions or reloads the meter element.
	 */
	function set(name:String, value:Dynamic):Void;

	/**
	 * Pauses rendering, unbinds events, removes the element from DOM, and stops listening to ticks.
	 */
	function destroy():Void;
}

typedef Options = {
	@:optional var interval:Int; // Update interval in milliseconds.
	@:optional var smoothing:Float; // Spike smoothing strength. 1 means no smoothing.
	@:optional var show:String; // Whether to show 'simplefps', or 'ms' = frame duration in milliseconds.
	@:optional var toggleOn:String; // Toggle between show 'simplefps' and 'ms' on this event.
	@:optional var decimals:Int; // Number of decimals in FPS number. 1 = 59.9, 2 = 59.94, ...
	@:optional var maxFps:Int; // Max expected FPS value.
	@:optional var threshold:Int; // Minimal tick reporting interval in milliseconds.

	// Meter position
	@:optional var position:String; // Meter position.
	@:optional var zIndex:Int; // Meter Z index.
	@:optional var left:String; // Meter left offset.
	@:optional var top:String; // Meter top offset.
	@:optional var right:String; // Meter right offset.
	@:optional var bottom:String; // Meter bottom offset.
	@:optional var margin:String; // Meter margin. Helps with centering the counter when left: 50%;

	// Theme
	@:optional var theme:String; // Meter theme. Build in: 'dark', 'light', 'transparent', 'colorful'.
	@:optional var heat:Int; // Allow themes to use coloring by FPS heat. 0 FPS = red, maxFps = green.

	// Graph
	@:optional var graph:Int; // Whether to show history graph.
	@:optional var history:Int; // How many history states to show in a graph.
}