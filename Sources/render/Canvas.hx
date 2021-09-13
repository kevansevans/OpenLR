package render;

import hxlr.engine.CanvasBase;

import kha.graphics2.Graphics;

class Canvas extends CanvasBase
{
    var stage:Graphics;

    public function new(_graphics2:Graphics) 
    {
        
        super();

        stage = _graphics2;
    }

    public function render() {
        
    }

    function renderBackground() 
    {
        
    }
}