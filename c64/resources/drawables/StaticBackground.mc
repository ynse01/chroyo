using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;

class StaticBackground extends Ui.Drawable {
    hidden var _back as Gfx.ColorType;

    function initialize(params) {
        Drawable.initialize(params);

        _back = params.get(:backColor);
    }
    
    function draw(dc as Gfx.Dc) as Void {
        if (isVisible) {
            var width = dc.getWidth() as Lang.Double;
            dc.setColor(_back, _back);
            dc.fillRectangle(0, 0, width, width);
        }
    }
}
