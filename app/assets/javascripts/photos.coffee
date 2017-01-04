# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

isRuLocale = (document.location.href).indexOf(".ru") > 0
viewerElementId = "photo-viewer"
nextArrId = "next_ph"
prevArrId = "prev_ph"
counterId = "ph_counter"
middleImgEscId = "close_reveral"
viewer = null
enableViewerKeys = true #когда происходит переход на другое фото, флаг ставится в false, как только произошел переход флаг возвращается в состояние true
curCollectionName = undefined
 

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

showFunc = (el)->
    $(el).attr("is-cur-img", "true")
    enableViewerKeys = true

showPhotoByIdx = (idx)->
    curColTrueSelector = if curCollectionName is undefined then "" else "[rc-box-collection=#{curCollectionName}]" 
    curColFalseSelector = if curCollectionName is undefined then "" else "[rc-box-collection!=#{curCollectionName}]"
    phsCount = viewer.find("#{curColTrueSelector}").length
    if idx < 1
        idx = 1
    else if idx > phsCount
        idx = phsCount
    togglleArrow(prevArrId, (idx>1))
    togglleArrow(nextArrId, (idx<phsCount))
    updViewerCounterText(idx, phsCount)
    if curCollectionName isnt undefined then viewer.find("img[rc-box-collection!=#{curCollectionName}]").hide(0, ()-> $(this).attr("is-cur-img", "false"))
    if phsCount > 1
        viewer.find("img[data-image-idx!=#{idx}]#{curColTrueSelector}").hide(0,
                                                            ()-> 
                                                                $(this).attr("is-cur-img", "false")
                                                                viewer.find("img[data-image-idx=#{idx}]#{curColTrueSelector}").fadeIn(300, ()-> showFunc(this))
                                                                )
    else
        viewer.find("img[data-image-idx=#{idx}]#{curColTrueSelector}").fadeIn(300, ()-> showFunc(this))
    console.log "#{idx} -- #{phsCount}"

getCurIdx = ()->
    parseInt(viewer.find("img[is-cur-img=true]").attr("data-image-idx"))

changePhoto = (id)->
    idx = getCurIdx()
    if id is prevArrId
        idx--
    else
        idx++
    showPhotoByIdx(idx)

initBoxPhotos = (phs)->
    clc = idx = 0
    collectionList = ""
    box_phs = ""
    colName = ""
    for p in phs
        if !p.hasAttribute("rc-box-collection")
            clc++
            idx = 1
            colName = "collection_#{clc}"
        else
            colName = $(p).attr("rc-box-collection")
            if collectionList.indexOf(colName) < 0
                idx = 1
                collectionList+=" #{colName} "
            else
                idx = $("[rc-box-collection=#{colName}][data-image-idx]").length + 1
        $(p).parents("a").attr("data-open", viewerElementId)
        $(p).attr("rc-box-collection", colName)
        $(p).attr("data-image-idx", "#{idx}")
        $(p).parents("a").click ()-> 
            curCollectionName = $(this).find("img").attr("rc-box-collection")
            showPhotoByIdx($(this).find("img").attr("data-image-idx"))
            console.log "#{curCollectionName}"
            
        box_phs += "<img rc-box-collection = \"#{colName}\" data-image-idx = \"#{idx}\" data-interchange = \"#{$(p).attr("rc-box-phs")}\">"
    return box_phs

r = ()-> 
    bPhotos = document.getElementsByClassName("kra-ph-box")
    if bPhotos.length > 0
        phs_html = initBoxPhotos(bPhotos)
        $("body").append("<div class=\"reveal\" id=\"#{viewerElementId}\" data-reveal data-v-offset = \"10%\"><div id = \"#{counterId}\"></div> <div id = \"ph-container\"><div id = \"#{prevArrId}\" class = \"arrows\"><span>&#12296;</span></div><div data-close id = \"#{middleImgEscId}\"></div><div id = \"#{nextArrId}\" class = \"arrows\"><span>&#12297;</span></div>#{phs_html}</div><button style = \"position: absolute;\" class=\"close-button\" data-close type=\"button\"><span aria-hidden=\"true\">&times;</span></button></div>")
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
                                           
        #elem = new Foundation.Reveal($("#photo-viewer"), {});

document.addEventListener("turbolinks:load", r)