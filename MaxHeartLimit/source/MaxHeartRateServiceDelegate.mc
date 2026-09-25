import Toybox.Activity;
import Toybox.Background;
import Toybox.Lang;
import Toybox.Notifications;
import Toybox.System;

(:background)
class MaxHeartLimitServiceDelegate extends System.ServiceDelegate {

    hidden var _threshold = 160;

    function initialize() {
        System.ServiceDelegate.initialize();
    }

    public function onTemporalEvent() as Void {
        // Do fun stuff here
        var heartRate = Activity.getActivityInfo().currentHeartRate;
        if (heartRate == null) {
            heartRate = 0;
        }
        if (heartRate > _threshold) {
            if (!$.HasSignalled) {
                Notifications.showNotification(Rez.Strings.alarm_title, Rez.Strings.alarm_body, null);
            }
            $.HasSignalled = true;
        } else {
            $.HasSignalled = false;
        }
    }
}