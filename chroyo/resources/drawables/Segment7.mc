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
        if (onA()) {
            var pointsA = [
                [locX + _thickness / 2d, locY + _thickness / 2d],
                [locX + _thickness, locY],
                [locX + width - _thickness, locY],
                [locX + width - _thickness / 2d, locY + _thickness / 2],
                [locX + width - _thickness, locY + _thickness],
                [locX + _thickness, locY + _thickness]
            ];
            dc.fillPolygon(pointsA);
        }
        if (onB()) {
            var pointsB = [
                [locX + width - _thickness / 2d, locY + _thickness / 2d],
                [locX + width, locY + _thickness],
                [locX + width, locY + (height - _thickness) / 2d],
                [locX + width - _thickness / 2d, locY + height / 2d],
                [locX + width - _thickness, locY + (height - _thickness) / 2d],
                [locX + width - _thickness, locY + _thickness]
            ];
            dc.fillPolygon(pointsB);
        }
        if (onC()) {
            var pointsC = [
                [locX + width - _thickness / 2d, locY + height / 2d],
                [locX + width, locY + (height + _thickness) / 2d],
                [locX + width, locY + height - _thickness / 2d],
                [locX + width - _thickness / 2d, locY + height],
                [locX + width - _thickness, locY + height - _thickness / 2d],
                [locX + width - _thickness, locY + (height + _thickness) / 2d]
            ];
            dc.fillPolygon(pointsC);
        }
        if (onD()) {
            var pointsD = [
                [locX + _thickness / 2d, locY + height],
                [locX + _thickness, locY + height - _thickness / 2d],
                [locX + width - _thickness, locY + height - _thickness / 2d],
                [locX + width - _thickness / 2d, locY + height],
                [locX + width - _thickness, locY + height + _thickness / 2d],
                [locX + _thickness, locY + height + _thickness / 2d]
            ];
            dc.fillPolygon(pointsD);
        }
        if (onE()) {
            var pointsE = [
                [locX + _thickness / 2d, locY + height / 2d],
                [locX + _thickness, locY + (height + _thickness) / 2d],
                [locX + _thickness, locY + height - _thickness / 2d],
                [locX + _thickness / 2d, locY + height],
                [locX, locY + height - _thickness / 2d],
                [locX, locY + (height + _thickness) / 2d]
            ];
            dc.fillPolygon(pointsE);
        }
        if (onF()) {
            var pointsF = [
                [locX + _thickness / 2d, locY + _thickness / 2d],
                [locX + _thickness, locY + _thickness],
                [locX + _thickness , locY + (height - _thickness) / 2d],
                [locX + _thickness / 2d, locY + height / 2d],
                [locX, locY + (height - _thickness) / 2d],
                [locX, locY + _thickness]
            ];
            dc.fillPolygon(pointsF);
            //dc.fillRectangle(locX, locY, _thickness, height / 2d);
        }
        if (onG()) {
            var pointsG = [
                [locX + _thickness / 2d, locY + height / 2d],
                [locX + _thickness, locY + (height - _thickness) / 2d],
                [locX + width - _thickness, locY + (height - _thickness) / 2d],
                [locX + width - _thickness / 2d, locY + height / 2d],
                [locX + width - _thickness, locY + (height + _thickness) / 2d],
                [locX + _thickness, locY + (height + _thickness) / 2d]
            ];
            dc.fillPolygon(pointsG);
        }
    }

    function onA() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 4:
                return false;
            default:
                return true;
        }
    }

    function onB() as Lang.Boolean {
        switch (_number) {
            case 5:
            case 6:
                return false;
            default:
                return true;
        }
    }

    function onC() as Lang.Boolean {
        switch (_number) {
            case 2:
                return false;
            default:
                return true;
        }
    }

    function onD() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 4:
            case 7:
                return false;
            default:
                return true;
        }
    }

    function onE() as Lang.Boolean {
        switch (_number) {
            case 1:
            case 3:
            case 4:
            case 5:
            case 7:
            case 9:
                return false;
            default:
                return true;
        }
    }

    function onF() as Lang.Boolean {
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

    function onG() as Lang.Boolean {
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