import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class MaxHeartLimitView extends WatchUi.View {

    hidden var _limitValue as Lang.String;

    function initialize() {
        View.initialize();
        _limitValue = "?";
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        _limitValue = Properties.getValue("limit").toString();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var limitText = View.findDrawableById("LimitValue") as Text;
        limitText.setText(_limitValue);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
