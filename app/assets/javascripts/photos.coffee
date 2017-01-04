# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

isRuLocale = (document.location.href).indexOf(".ru") > 0
viewerElementId = "photo-viewer"
nextArrId = "next_ph"
prevArrId = "prev_ph"
counterId = "ph_counter"
viewer = null
enableViewerKeys = true #когда происходит переход на другое фото, флаг ставится в false, как только произошел переход флаг возвращается в состояние true

updViewerCounterText = (idx, count)->
    if count > 1
        h = if isRuLocale then {"photo": "фото", "fr": "из"} else {"photo": "photo", "fr": "of"}
        txt = "#{h.photo} <span class = \"rc-bold\">#{idx}</span> #{h.fr} <span class = \"rc-bold\">#{count}</span>"
    else 
        txt = ""
    viewer.find("##{counterId}").html txt
    return

togglleArrow = (arr_id, act_is_show)->
    if act_is_show then viewer.find("##{arr_id}").show() else viewer.find("##{arr_id}").hide()

showPhotoByIdx = (idx)->
    phsCount = viewer.find("img[data-image-idx]").length
    if idx < 1
        idx = 1
    else if idx > phsCount
        idx = phsCount
    togglleArrow(prevArrId, (idx>1))
    togglleArrow(nextArrId, (idx<phsCount))
    updViewerCounterText(idx, phsCount)
    
    viewer.find("img[data-image-idx!=#{idx}]").hide(0,
                                                        ()-> 
                                                            $(this).attr("is-cur-img", "false")
                                                            viewer.find("img[data-image-idx=#{idx}]").fadeIn(300, ()-> 
                                                                                                                        $(this).attr("is-cur-img", "true")
                                                                                                                        enableViewerKeys = true
                                                                                                            )
    )
    #console.log "#{idx} -- #{phsCount}"

getCurIdx = ()->
    parseInt(viewer.find("img[is-cur-img=true]").attr("data-image-idx"))

changePhoto = (id)->
    idx = getCurIdx()
    if id is prevArrId
        idx--
    else
        idx++
    showPhotoByIdx(idx)

r = ()-> 
    bPhotos = document.getElementsByClassName("kra-ph-box")
    if bPhotos.length > 0
        box_phs = ""
        idx = 0
        for p in bPhotos
            idx++
            $(p).parents("a").attr("data-open", viewerElementId)
            $(p).attr("data-image-idx", "#{idx}")                                
            box_phs += "<img data-image-idx = \"#{idx}\" data-interchange = \"#{$(p).attr("data-box-phs")}\">"  
            $(p).parents("a").click ()-> showPhotoByIdx($(this).find("img").attr("data-image-idx"))
        $("body").append("<div class=\"reveal\" id=\"#{viewerElementId}\" data-reveal data-v-offset = \"10%\"><div id = \"#{counterId}\"></div> <div id = \"ph-container\"><div id = \"#{prevArrId}\" class = \"arrows\"><span>&#12296;</span></div><div id = \"#{nextArrId}\" class = \"arrows\"><span>&#12297;</span></div>#{box_phs}</div><button style = \"position: absolute;\" class=\"close-button\" data-close type=\"button\"><span aria-hidden=\"true\">&times;</span></button></div>")
        viewer = $("##{viewerElementId}")
        viewer.find(".arrows").click ()-> changePhoto(this.id) 
        viewer.keydown (event)->
            if not enableViewerKeys then return
            enableViewerKeys = false 
            curIdx = getCurIdx()
            if event.keyCode is 37
                curIdx--
                showPhotoByIdx(curIdx)
                #return
            if event.keyCode is 39
                curIdx++
                showPhotoByIdx(curIdx)
                #return
            console.log "#{curIdx}"
        showPhotoByIdx(1)
                                           
        #elem = new Foundation.Reveal($("#photo-viewer"), {});

document.addEventListener("turbolinks:load", r)