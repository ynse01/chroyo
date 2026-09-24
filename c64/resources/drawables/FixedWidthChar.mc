using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;

class FixedWidthChar extends Ui.Drawable {
    hidden var _fore as Gfx.ColorType;
    hidden var _back as Gfx.ColorType;
    hidden var _bits as Lang.Long;

    function initialize(params) {
        Drawable.initialize(params);

        _fore = params.get(:foreColor);
        _back = params.get(:backColor);
        // Uninitialized character
        _bits = 0xff818181818181ffl;
    }
    
    function setCharacter(c as Lang.Integer) as Void {
        _bits = (c64_charset1 as Lang.Array<Lang.Long>)[c];
    }

    function draw(dc as Gfx.Dc) as Void {
        var size = width / 8d;
        if (isVisible) {
            dc.setColor(_back, _back);
            dc.fillRectangle(locX, locY, size * 8d, size * 8d);
            dc.setColor(_fore, _back);
            for(var iy = 0; iy < 8; iy++) {
                for(var ix = 0; ix < 8; ix++) {
                    if (getBit(ix, iy)) {
                        var x = locX + (ix * size);
                        var y = locY + (iy * size);
                        dc.fillRectangle(x, y, size, size);
                    }
                }
            }
        }
    }

    function getBit(ix as Lang.Integer, iy as Lang.Integer) as Lang.Boolean {
        var i = (7 - ix) + ((7 - iy) * 8);
        var mask = 1l << i.toLong();
        return (_bits & mask) > 0l;
    }
}