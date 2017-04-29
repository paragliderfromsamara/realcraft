# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
selBoat = null
updLayers = ->
    v = selBoat.val()
    idx = 0
    selBoat.find("option").each (i)->
        if $(this).val() is v then idx = i
    $(".boat-block[data-boat-block-idx!=#{idx}]").hide()
    $(".boat-block[data-boat-block-idx=#{idx}]").show()

r = ()-> 
    selBoat = document.getElementById("boat_request_boat_name")
    if selBoat isnt null 
        selBoat = $(selBoat)
        updLayers()
        selBoat.change ()-> updLayers()
    #elem = new Foundation.Reveal($("#photo-viewer"), {});

document.addEventListener("turbolinks:load", r)