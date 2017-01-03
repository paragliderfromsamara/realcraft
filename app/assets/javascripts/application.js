// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require motion-ui
//= require foundation-sites
//= require turbolinks
//= require_tree .


var readyFunc = function()
{
    //var elem = null;
    var elem, requestHash;
    $(document).foundation();
    requestHash = getHashCodeFromRequest();
   // elem = new Foundation.Tabs("#rc-data-tabs", {});
    windowResizeFunc();
    
    $("#rc-data-tabs").on('change.zf.tabs', function() {
      window.location.href = $('[data-tabs]').find(".is-active a").attr("href");
    });
    
    if ($('[data-tabs]').length > 0 && requestHash.length>0)
    {
        $("#rc-data-tabs").foundation('selectTab', $(requestHash));
    }
    //elem = new Foundation.DropdownMenu($("#dd-menu"));
    
}

var windowResizeFunc = function()
{
    $(".orbit-container").height($(".orbit").height());
}

function getHashCodeFromRequest()
{
  var curLoc = window.location.href;
  var s = "";
  if (curLoc.indexOf("#") > 0){for(var i=curLoc.indexOf("#"); i<curLoc.length; i++) s+= curLoc[i];}
  return s;
  
}


document.addEventListener("turbolinks:load", readyFunc);
$(window).resize(windowResizeFunc);