import Toybox.Lang;
import Toybox.WatchUi;

class MaxHeartLimitDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MaxHeartLimitMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}