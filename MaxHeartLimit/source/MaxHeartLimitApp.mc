import Toybox.Application;
import Toybox.Background;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

(:background)
var HasSignalled;

(:background)
class MaxHeartLimitApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();

        // Register to run every five seconds
        if(Background.getTemporalEventRegisteredTime() != null) {
            Background.registerForTemporalEvent(new Time.Duration(5));
        }
        // Initialize the dedup flag
        $.HasSignalled = false;
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new MaxHeartLimitView() ];
    }

    public function getServiceDelegate() as [System.ServiceDelegate] {
        return [ new MaxHeartLimitServiceDelegate() ];
    }
}

function getApp() as MaxHeartLimitApp {
    return Application.getApp() as MaxHeartLimitApp;
}