using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System;
using Toybox.Lang as Lang;
using Toybox.Activity;

class HeartRateWidget extends Ui.Drawable {

    hidden var _foreColor as Gfx.ColorType;
    hidden var _backColor as Gfx.ColorType;
    hidden var _textColor as Gfx.ColorType;
    hidden var _locX as Lang.Double;
    hidden var _locY as Lang.Double;
    hidden var _radius as Lang.Double;

    function initialize(params) {
        Drawable.initialize(params);

        _foreColor = params.get(:foreColor);
        _backColor = params.get(:backColor);
        _textColor = params.get(:textColor);
        _locX = params.get(:locX);
        _locY = params.get(:locY);
        _radius = params.get(:radius);
    }
    
    function draw(dc as Gfx.Dc) as Void {
        var heartRate = Activity.getActivityInfo().currentHeartRate;
        if (heartRate == null) {
            heartRate = 42;
        }
        dc.setColor(_backColor, Gfx.COLOR_DK_GRAY);
        dc.fillCircle(_locX, _locY, _radius);
        dc.setColor(_foreColor, _backColor);
        drawHeart(dc);
        dc.setColor(_textColor, Gfx.COLOR_TRANSPARENT);
        var textSize = dc.getTextDimensions(heartRate.toString(), Gfx.FONT_LARGE);
        dc.drawText(_locX, _locY - (textSize[1].toDouble() / 2d), Gfx.FONT_LARGE, heartRate.toString(), Gfx.TEXT_JUSTIFY_CENTER);
    }

    function drawHeart(dc as Gfx.Dc) as Void {
        var radiusSqrt2 = _radius / Math.sqrt(2d);
        var trianglePoints = [
            [_locX - radiusSqrt2, _locY - radiusSqrt2],
            [_locX + radiusSqrt2, _locY - radiusSqrt2],
            [_locX, _locY + _radius]
        ];
        dc.fillPolygon(trianglePoints);
    }

    function drawTriangleTick(dc as Gfx.Dc, angle as Lang.Double) as Void {
        
    }
}