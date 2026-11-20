using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System;
using Toybox.Lang as Lang;
using Toybox.Activity;

class Segment7 extends Ui.Drawable {

    hidden var _foreColor as Gfx.ColorType;
    hidden var _backColor as Gfx.ColorType;
    hidden var _number as Lang.Integer;
    hidden var _thickness as Lang.Double;

    function initialize(params) {
        Drawable.initialize(params);

        _foreColor = params.get(:foreColor);
        _backColor = params.get(:backColor);
        _number = 8;
        _thickness = params.get(:thickness).toDouble();
    }
    
    public function setNumber(number as Lang.Integer) as Void {
        _number = number % 10;
    }

    function draw(dc as Gfx.Dc) as Void {
        dc.setColor(_foreColor, _backColor);
        switch(_number) {
            case 0:
                drawA(dc);
                drawB(dc);
                drawC(dc);
                drawD(dc);
                drawE(dc);
                drawF(dc);
                break;
            case 1:
                drawB(dc);
                drawC(dc);
                break;
            case 2:
                drawA(dc);
                drawB(dc);
                drawD(dc);
                drawE(dc);
                drawG(dc);
                break;
            case 3:
                drawA(dc);
                drawB(dc);
                drawC(dc);
                drawD(dc);
                drawG(dc);
                break;
            case 4:
                drawB(dc);
                drawC(dc);
                drawF(dc);
                drawG(dc);
                break;
            case 5:
                drawA(dc);
                drawC(dc);
                drawD(dc);
                drawF(dc);
                drawG(dc);
                break;
            case 6:
                drawA(dc);
                drawC(dc);
                drawD(dc);
                drawE(dc);
                drawF(dc);
                drawG(dc);
                break;
            case 7:
                drawA(dc);
                drawB(dc);
                drawC(dc);
                break;
            case 8:
                drawA(dc);
                drawB(dc);
                drawC(dc);
                drawD(dc);
                drawE(dc);
                drawF(dc);
                drawG(dc);
                break;
            case 9:
                drawA(dc);
                drawB(dc);
                drawC(dc);
                drawD(dc);
                drawF(dc);
                drawG(dc);
                break;
            default:
                // silently draw nothing
                break;
        }
    }

    function drawA(dc as Gfx.Dc) {
        var points = [
            [locX + _thickness / 2d, locY + _thickness / 2d],
            [locX + _thickness, locY],
            [locX + width - _thickness, locY],
            [locX + width - _thickness / 2d, locY + _thickness / 2],
            [locX + width - _thickness, locY + _thickness],
            [locX + _thickness, locY + _thickness]
        ];
        dc.fillPolygon(points);
    }

    function drawB(dc as Gfx.Dc) {
        var points = [
            [locX + width - _thickness / 2d, locY + _thickness / 2d],
            [locX + width, locY + _thickness],
            [locX + width, locY + (height - _thickness) / 2d],
            [locX + width - _thickness / 2d, locY + height / 2d],
            [locX + width - _thickness, locY + (height - _thickness) / 2d],
            [locX + width - _thickness, locY + _thickness]
        ];
        dc.fillPolygon(points);
    }

    function drawC(dc as Gfx.Dc) {
        var points = [
            [locX + width - _thickness / 2d, locY + height / 2d],
            [locX + width, locY + (height + _thickness) / 2d],
            [locX + width, locY + height - _thickness / 2d],
            [locX + width - _thickness / 2d, locY + height],
            [locX + width - _thickness, locY + height - _thickness / 2d],
            [locX + width - _thickness, locY + (height + _thickness) / 2d]
        ];
        dc.fillPolygon(points);
    }

    function drawD(dc as Gfx.Dc) {
        var points = [
            [locX + _thickness / 2d, locY + height],
            [locX + _thickness, locY + height - _thickness / 2d],
            [locX + width - _thickness, locY + height - _thickness / 2d],
            [locX + width - _thickness / 2d, locY + height],
            [locX + width - _thickness, locY + height + _thickness / 2d],
            [locX + _thickness, locY + height + _thickness / 2d]
        ];
        dc.fillPolygon(points);
    }

    function drawE(dc as Gfx.Dc) {
        var points = [
            [locX + _thickness / 2d, locY + height / 2d],
            [locX + _thickness, locY + (height + _thickness) / 2d],
            [locX + _thickness, locY + height - _thickness / 2d],
            [locX + _thickness / 2d, locY + height],
            [locX, locY + height - _thickness / 2d],
            [locX, locY + (height + _thickness) / 2d]
        ];
        dc.fillPolygon(points);
    }

    function drawF(dc as Gfx.Dc) {
        var points = [
            [locX + _thickness / 2d, locY + _thickness / 2d],
            [locX + _thickness, locY + _thickness],
            [locX + _thickness , locY + (height - _thickness) / 2d],
            [locX + _thickness / 2d, locY + height / 2d],
            [locX, locY + (height - _thickness) / 2d],
            [locX, locY + _thickness]
        ];
        dc.fillPolygon(points);
    }

    function drawG(dc as Gfx.Dc) {
        var points = [
            [locX + _thickness / 2d, locY + height / 2d],
            [locX + _thickness, locY + (height - _thickness) / 2d],
            [locX + width - _thickness, locY + (height - _thickness) / 2d],
            [locX + width - _thickness / 2d, locY + height / 2d],
            [locX + width - _thickness, locY + (height + _thickness) / 2d],
            [locX + _thickness, locY + (height + _thickness) / 2d]
        ];
        dc.fillPolygon(points);
    }
}