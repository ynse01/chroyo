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
        var middle = locY + _thickness / 2d;
        drawHorizontal(dc, middle);
    }

    function drawB(dc as Gfx.Dc) {
        var middle = locX + width - _thickness / 2d;
        drawVerticalTop(dc, middle);
    }

    function drawC(dc as Gfx.Dc) {
        var middle = locX + width - _thickness / 2d;
        drawVerticalBottom(dc, middle);
    }

    function drawD(dc as Gfx.Dc) {
        var middle = locY + height - _thickness / 2d;
        drawHorizontal(dc, middle);
    }

    function drawE(dc as Gfx.Dc) {
        var middle = locX + _thickness / 2d;
        drawVerticalBottom(dc, middle);
    }

    function drawF(dc as Gfx.Dc) {
        var middle = locX + _thickness / 2d;
        drawVerticalTop(dc, middle);
    }

    function drawG(dc as Gfx.Dc) {
        var middle = locY + height / 2d;
        drawHorizontal(dc, middle);
    }

    function drawHorizontal(dc as Gfx.Dc, middle as Lang.Double) {
        var halfThick = _thickness / 2d;
        var points = [
            [locX + _thickness / 2d, middle],
            [locX + _thickness, middle - halfThick],
            [locX + width - _thickness, middle - halfThick],
            [locX + width - _thickness / 2d, middle],
            [locX + width - _thickness, middle + halfThick],
            [locX + _thickness, middle + halfThick]
        ];
        dc.fillPolygon(points);
    }

    function drawVerticalTop(dc as Gfx.Dc, middle as Lang.Double) {
        var halfThick = _thickness / 2d;
        var top = locY + halfThick;
        var bottom = top - halfThick + height / 2d;
        var points = [
            [middle, top],
            [middle + halfThick, top + halfThick],
            [middle + halfThick, bottom - halfThick],
            [middle, bottom],
            [middle - halfThick, bottom - halfThick],
            [middle - halfThick, top + halfThick]
        ];
        dc.fillPolygon(points);
    }

    function drawVerticalBottom(dc as Gfx.Dc, middle as Lang.Double) {
        var halfThick = _thickness / 2d;
        var top = locY + height / 2d;
        var bottom = locY + height - halfThick;
        var points = [
            [middle, top],
            [middle + halfThick, top + halfThick],
            [middle + halfThick, bottom - halfThick],
            [middle, bottom],
            [middle - halfThick, bottom - halfThick],
            [middle - halfThick, top + halfThick]
        ];
        dc.fillPolygon(points);
    }
}