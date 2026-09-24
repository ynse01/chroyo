using Toybox.Graphics as Gfx;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Activity;
import Toybox.ActivityMonitor;

class ChroyoView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Gfx.Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Gfx.Dc) as Void {
        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_DK_GRAY);
        dc.clear();
        
        // Get and show the current time
        var clockTime = System.getClockTime();
        var moment = Time.now();
        var dateInfo = Gregorian.info(moment, Time.FORMAT_MEDIUM);
        var timeString = Lang.format("$1$ $2$ $3$:$4$", [dateInfo.day_of_week, dateInfo.day, clockTime.hour, clockTime.min.format("%02d")]);
        var timeLabel = View.findDrawableById("TimeLabel") as Text;
        timeLabel.setText(timeString);

        var triangleTicks = View.findDrawableById("MainTicks") as TriangleTicks;
        triangleTicks.draw(dc);

        var secondsHand = View.findDrawableById("Seconds") as RectangularHand;
        secondsHand.atAngle(clockTime.sec.toDouble() / 60d);
        secondsHand.draw(dc);

        var minuteHand = View.findDrawableById("Minute") as RectangularHand;
        minuteHand.atAngle(clockTime.min.toDouble() / 60d);
        minuteHand.draw(dc);

        var hourHand = View.findDrawableById("Hour") as RectangularHand;
        hourHand.atAngle(clockTime.hour.toDouble() / 12d);
        hourHand.draw(dc);

        /*var heartLabel = View.findDrawableById("HeartLabel") as Text;
        var heartRate = Activity.getActivityInfo().currentHeartRate;
        if (heartRate == null) {
            heartRate = 42;
        }
        heartLabel.setText(heartRate.toString());
        */
        var heartWidget = View.findDrawableById("HeartRate") as HeartRateWidget;
        heartWidget.draw(dc);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
