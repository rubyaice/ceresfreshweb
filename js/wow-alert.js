    (function ($) {

        var defaults = {
            label: "OK",
            title: "Información",
            location: "#",
            autoClose: true
        };

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
            var elements = $("<div class='wow-alert-overlay'></div><div class='wow-alert-content'><div class='wow-alert-content-title'><span>" + this.options.title + "</span></div><div class='wow-alert-content-padding'><p>" + msg + "</p><a id='foco' tabindex='0' href='" + this.options.location + "'>" + this.options.label + "</a></div></div>");

            if(this._alertOverlay)
                this._alertOverlay.remove();
            if(this._alertWindow)
                this._alertWindow.remove();

            this._alertOverlay = $(elements[0]);
            this._alertWindow = $(elements[1]);

            this._actionButton = this._alertWindow.find('a');

            this._alertOverlay.appendTo("body");
            this._alertWindow.appendTo("body");

            return [this._alertOverlay, this._alertWindow];
        }

        function configureActions() {
            var context = this;

            this._actionButton.bind('click', function (e) {
                e.preventDefault();
                if(context.options.location != "#") window.location = context.options.location;
                if (context.options.autoClose) close();
                if (context.options.success) context.options.success();
            });
        }

        function close(){
            this._alertOverlay.remove();
            this._alertWindow.remove();
        }

        window.originalAlert = window.alert;

        window.alert = function (msg, opts){
            this.options = $.extend(defaults, opts);
            createWindow(msg);
            centerWindow();
            configureActions();
            document.getElementById('foco').focus();

        }

    }(jQuery));
