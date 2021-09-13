package;

import render.Canvas;
import kha.Assets;
import kha.Image;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import render.LRAssets;

class Main {
	
	static var lrAssets:LRAssets;
	static var stage:Canvas;

	static function update(): Void {

	}

	static function render(frames: Array<Framebuffer>): Void 
	{

		var g2 = frames[0].g2;

		if (stage == null) stage = new Canvas(g2);

		g2.begin(true);

		stage.render();

		g2.end();
	}

	public function new() {
		
	}

	public static function main() {

		System.start({title: "Project", width: 1280, height: 720}, function (_) {
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (frames) { render(frames); });
			});
		});
	}
}
