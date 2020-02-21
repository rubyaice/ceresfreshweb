(function ($) {

    jQuery.fn.extend({
        halfWidth: function () {
            var width = 0;
            this.each(function () {
                width += $(this).outerWidth() / 2;
            });
            return width;
        },
        halfHeight: function () {
            var height = 0;
            this.each(function () {
                height += $(this).outerHeight() / 2;
            });
            return height;
        }
    });
    function centerWindow() {
        this._alertWindow.css({
            marginLeft: -this._alertWindow.halfWidth(),
            marginTop: -this._alertWindow.halfHeight()
        });
    }

    function createWindow(msg) {
        var elements = $("<div class='wow-wait-overlay'></div><div class='wow-wait-content'><img src='"+base_url+"img/Wait.gif' alt='Wait'></div></div>");
        if(this._alertOverlay)
            this._alertOverlay.remove();
        if(this._alertWindow)
            this._alertWindow.remove();

        this._alertOverlay = $(elements[0]);
        this._alertWindow = $(elements[1]);

        this._alertOverlay.appendTo("body");
        this._alertWindow.appendTo("body");

        return [this._alertOverlay, this._alertWindow];
    }


    function close(){
        this._alertOverlay.remove();
        this._alertWindow.remove();
    }
    window.CloseModalWait = function (){
        close();
    };
    window.ModalWait = function (){
        createWindow();
        centerWindow();
    }


}(jQuery));
