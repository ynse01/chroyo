using Toybox.Lang as Lang;
using Toybox.Graphics as Gfx;
using Toybox.Math;

public var pi2 as Lang.Double = Math.PI.toDouble() * 2d;

public function rotatedRectangle(angle as Lang.Double, center as Gfx.Point2D, radius as Lang.Double) as Lang.Array<Gfx.Point2D> {
    var lengthX = Math.sin(angle) * radius as Lang.Double;
    var lengthY = -Math.cos(angle) * radius as Lang.Double;
    var widthX = Math.cos(angle) * 2d as Lang.Double;
    var widthY = Math.sin(angle) * 2d as Lang.Double;
    var points = [
        [center[0] - widthX, center[1] - widthY],
        [center[0] + lengthX - widthX, center[1] + lengthY - widthY],
        [center[0] + lengthX + widthX, center[1] + lengthY + widthY],
        [center[0] + widthX, center[1] + widthY],
        [center[0] - widthX, center[1] - widthY]
    ];
    return points;
}

public function polar(center as Gfx.Point2D, angle as Lang.Double, radius as Lang.Double) as Gfx.Point2D {
    var x = Math.sin(angle) * radius as Lang.Double;
    var y = -Math.cos(angle) * radius as Lang.Double;
    return [center[0] + x, center[1] + y];
}

public function mod(a as Lang.Double, b as Lang.Double) as Lang.Double {
    if (b == 0d) {
        return a;
    }
    return a - b * Math.floor(a / b);
}

public function modi(a as Lang.Integer, b as Lang.Integer) as Lang.Integer {
    if (b == 0) {
        return a;
    }
    return a - b * Math.floor(a / b);
}

public function wrapAngle(angle as Lang.Double) as Lang.Double {
    return mod(angle + pi2, pi2);
}
