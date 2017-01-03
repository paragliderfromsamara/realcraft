# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

viewerElementId = "photo-viewer"

showPhotoByIdx = (idx)->
    viewer = $("##{viewerElementId}")
    phsCount = viewer.find("img[data-image-idx]").length
    if idx < 1
        idx = 1
    else if idx > phsCount
        idx = phsCount
    viewer.find("img[data-image-idx=#{idx}]").removeClass("hide").attr("is-cur-img", "true")
    viewer.find("img[data-image-idx!=#{idx}]").addClass("hide").attr("is-cur-img", "false")
    console.log "#{idx} -- #{phsCount}"

getCurIdx = ()->
    parseInt($("##{viewerElementId}").find("img[is-cur-img=true]").attr("data-image-idx"))

changePhoto = (el)->
    idx = getCurIdx()
    if el.id is "prev_ph"
        idx--
    else
        idx++
    showPhotoByIdx(idx)
    
go_next_photo = ()->
    $()
    console.log "to_do go_next_photo" 

go_prev_photo = ()->
    console.log "go_prev_photo" 
    

r = ()-> 
    bPhotos = document.getElementsByClassName("kra-ph-box")
    if bPhotos.length > 0
        box_phs = ""
        idx = 0
        for p in bPhotos
            idx++
            $(p).parents("a").attr("data-open", viewerElementId)
            $(p).attr("data-image-idx", "#{idx}")                                
            box_phs += "<img data-image-idx = \"#{idx}\" style = \"positon: relative;\" data-interchange = \"#{$(p).attr("data-box-phs")}\">"  
            $(p).parents("a").click ()-> showPhotoByIdx($(this).find("img").attr("data-image-idx"))
        $("body").append("<div class=\"reveal\" id=\"#{viewerElementId}\" data-reveal><div id = \"ph-container\"><div id = \"prev_ph\" class = \"arrows\"><span><</span></div><div id = \"next_ph\" class = \"arrows\"><span>></span></div>#{box_phs}</div></div>")
        $("##{viewerElementId}").find(".arrows").click ()-> changePhoto(this) 
        showPhotoByIdx(1)
                                           
        #elem = new Foundation.Reveal($("#photo-viewer"), {});

document.addEventListener("turbolinks:load", r)