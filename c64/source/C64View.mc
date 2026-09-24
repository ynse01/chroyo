using Toybox.Graphics as Gfx;
import Toybox.Lang;
import Toybox.System;
using Toybox.Sensor as Sensor;
import Toybox.WatchUi;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Activity;
import Toybox.ActivityMonitor;

class C64View extends WatchUi.WatchFace {

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
        var center = dc.getWidth() / 2d as Lang.Double;
        // Allow room for 6 digits.
        var digitSize = Math.floor(center / 24d) * 8d as Lang.Double;

        var back = View.findDrawableById("Background") as StaticBackground;
        back.draw(dc);

        // Get and show the current time
        var clockTime = System.getClockTime();

        var hour1 = View.findDrawableById("HourDigit1") as FixedWidthChar;
        hour1.setLocation(center - (2.5d * digitSize), center - (0.5d * digitSize));
        hour1.setSize(digitSize, digitSize);
        hour1.setCharacter(48 + Math.floor(clockTime.hour / 10));
        hour1.draw(dc);
        
        var hour2 = View.findDrawableById("HourDigit2") as FixedWidthChar;
        hour2.setLocation(center - (1.5d * digitSize), center - (0.5d * digitSize));
        hour2.setSize(digitSize, digitSize);
        hour2.setCharacter(48 + modi(clockTime.hour, 10));
        hour2.draw(dc);

        var seperator = View.findDrawableById("HourSeperator") as FixedWidthChar;
        seperator.setLocation(center - (0.5d * digitSize), center - (0.5d * digitSize));
        seperator.setSize(digitSize, digitSize);
        seperator.setCharacter(58);
        seperator.draw(dc);

        var min1 = View.findDrawableById("MinuteDigit1") as FixedWidthChar;
        min1.setLocation(center + (0.5d * digitSize), center - (0.5d * digitSize));
        min1.setSize(digitSize, digitSize);
        min1.setCharacter(48 +  Math.floor(clockTime.min / 10));
        min1.draw(dc);

        var min2 = View.findDrawableById("MinuteDigit2") as FixedWidthChar;
        min2.setLocation(center + (1.5d * digitSize), center - (0.5d * digitSize));
        min2.setSize(digitSize, digitSize);
        min2.setCharacter(48 + modi(clockTime.min, 10));
        min2.draw(dc);

        // Get the heart rate
        var heartRate = Activity.getActivityInfo().currentHeartRate;
        if (heartRate == null) {
            heartRate = 0;
        }

        if (heartRate >= 100) {
            var heart1 = View.findDrawableById("HeartDigit1") as FixedWidthChar;
            heart1.setLocation(center - (2.0d * digitSize), center + (1.5d * digitSize));
            heart1.setSize(digitSize, digitSize);
            heart1.setCharacter(48 + Math.floor(heartRate / 100));
            heart1.draw(dc);
        }
        var heart2 = View.findDrawableById("HeartDigit2") as FixedWidthChar;
        heart2.setLocation(center - (1.0d * digitSize), center + (1.5d * digitSize));
        heart2.setSize(digitSize, digitSize);
        heart2.setCharacter(48 + Math.floor(modi(heartRate, 100) / 10));
        heart2.draw(dc);
    
        var heart3 = View.findDrawableById("HeartDigit3") as FixedWidthChar;
        heart3.setLocation(center - (0.0d * digitSize), center + (1.5d * digitSize));
        heart3.setSize(digitSize, digitSize);
        heart3.setCharacter(48 + modi(heartRate, 10));
        heart3.draw(dc);

        var heartIcon = View.findDrawableById("HeartIcon") as FixedWidthChar;
        heartIcon.setLocation(center + (1.0d * digitSize), center + (1.5d * digitSize));
        heartIcon.setSize(digitSize, digitSize);
        heartIcon.setCharacter(83);
        heartIcon.draw(dc);

        var weather = Weather.getCurrentConditions();
        if (weather != null && weather.temperature != null) {
            var temperature = weather.temperature.toNumber();
            var temp1 = View.findDrawableById("TemperatureDigit1") as FixedWidthChar;
            temp1.setLocation(center - (1.0d * digitSize), center - (2.5d * digitSize));
            temp1.setSize(digitSize, digitSize);
            temp1.setCharacter(48 + Math.floor(modi(temperature, 100) / 10));
            temp1.draw(dc);
        
            var temp2 = View.findDrawableById("TemperatureDigit2") as FixedWidthChar;
            temp2.setLocation(center - (0.0d * digitSize), center - (2.5d * digitSize));
            temp2.setSize(digitSize, digitSize);
            temp2.setCharacter(48 + modi(temperature, 10));
            temp2.draw(dc);

            var tempIcon = View.findDrawableById("TemperatureIcon") as FixedWidthChar;
            tempIcon.setLocation(center + (1.0d * digitSize), center - (2.5d * digitSize));
            tempIcon.setSize(digitSize, digitSize);
            tempIcon.setCharacter(3);
            tempIcon.draw(dc);
        }
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
