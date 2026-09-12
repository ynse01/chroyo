using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;

class TriangleTicks extends Ui.Drawable {
    hidden var _color as Gfx.ColorType;

    function initialize(params) {
        Drawable.initialize(params);

        _color = params.get(:color);
    }
    
    function draw(dc as Gfx.Dc) as Void {
        var width = dc.getWidth().toDouble();
        var center = [width / 2d, width / 2d];
        for(var i = 0; i < 12; i++) {
            var points = rotatedTriangle(center, i.toDouble() / 12d, width / 2d);
            dc.setColor(_color, Gfx.COLOR_DK_GRAY);
            dc.fillPolygon(points);
        }
    }

    private function rotatedTriangle(center as Gfx.Point2D, angle as Lang.Double, radius as Lang.Double)  as Lang.Array<Gfx.Point2D> {
        var middleRadians = angle * pi2;
        var topRadians = wrapAngle(middleRadians - (0.003 * pi2));
        var bottomRadians = wrapAngle(middleRadians + (0.003 * pi2));

        var points = [
            polar(center, topRadians, radius),
            polar(center, bottomRadians, radius),
            polar(center, middleRadians, radius * 0.95d)
        ];
        return points;
    }

}