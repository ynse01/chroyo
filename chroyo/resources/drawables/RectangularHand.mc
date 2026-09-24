using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System;
using Toybox.Lang as Lang;

class RectangularHand extends Ui.Drawable {

    hidden var _color as Gfx.ColorType;
    hidden var _length as Lang.Double;
    hidden var _angle as Lang.Double;

    function initialize(params) {
        Drawable.initialize(params);

        _color = params.get(:color);
        _length = params.get(:length);
        _angle = 0d;
    }
    
    function draw(dc as Gfx.Dc) as Void {
        var width = dc.getWidth().toDouble();
        var height = dc.getHeight().toDouble();
        var radius = width * _length.toDouble() / 200d;
        var points = rotatedRectangle(_angle * Math.PI.toDouble() * 2d, [width / 2d, height / 2d], radius);
        dc.setColor(_color, Gfx.COLOR_DK_GRAY);
        dc.fillPolygon(points);
    }

    function atAngle(angle as Lang.Double) as Void {
        _angle = angle;
    }
}