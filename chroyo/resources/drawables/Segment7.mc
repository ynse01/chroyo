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
        _number = number;
    }

    function draw(dc as Gfx.Dc) as Void {
        dc.setColor(_foreColor, _backColor);
        if (isOnA()) {
            drawA(dc);
        }
        if (isOnB()) {
            drawB(dc);
        }
        if (isOnC()) {
            drawC(dc);
        }
        if (isOnD()) {
            drawD(dc);
        }
        if (isOnE()) {
            drawE(dc);
        }
        if (isOnF()) {
            drawF(dc);
        }
        if (isOnG()) {
            drawG(dc);
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

    function isOnA() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 4:
                return false;
            default:
                return true;
        }
    }

    function isOnB() as Lang.Boolean {
        switch (_number) {
            case 5:
            case 6:
                return false;
            default:
                return true;
        }
    }

    function isOnC() as Lang.Boolean {
        switch (_number) {
            case 2:
                return false;
            default:
                return true;
        }
    }

    function isOnD() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 4:
            case 7:
                return false;
            default:
                return true;
        }
    }

    function isOnE() as Lang.Boolean {
        switch (_number) {
            case 2:
            case 6:
            case 8:
            case 0:
                return true;
            default:
                return false;
        }
    }

    function isOnF() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 2:
            case 3:
            case 7:
                return false;
            default:
                return true;
        }
    }

    function isOnG() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 7:
            case 0:
                return false;
            default:
                return true;
        }
    }
}