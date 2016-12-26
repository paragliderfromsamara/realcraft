module ApplicationHelper
  def cur_locale
       I18n.locale
  end
  def main_page_slider_imgs #изображения слайдера с главной страницы
    [
      "/slider/index/1_small.jpg",
      "/slider/index/4_small.jpg"
    ]
  end
  
  
  def rc_header(big, small = nil, small_bot = nil)
    v = ""
    v += "<h3>#{small}</h3>" if !small.nil? 
    v += "<h1>#{big}</h1>"
    v += "<h4>#{small_bot}</h4>" if !small_bot.nil? 
    return "<div id = \"rc-header\">#{v}</div>".html_safe
  end
  
  def model_view_imgs_name
    [
      {url: "top_model_view.jpg", title: t(:top_view)},
      {url: "back_model_view.jpg", title: t(:aft_view)},
      {url: "forward_model_view.jpg", title: t(:bow_view)}
    ]
  end
  
  def real_craft_190
    @ru_head_desc = "Realсraft 190 позволит Вам ощутить всё разнообразие отдыха на воде. "
    @en_head_desc = "Realсraft 190 can provide you a wide range of leisure
activities on the water. Increased main cockpit, wide
passage to the front cockpit, level floor, spacious units 
for storage of anchors, halyards, fenders and other
things, shelves for spinning and fishing rods along the 
boards make Realсraft 190 a great boat for enthusiastic 
fishermen."
    @ru_slogan = "СОЗДАНА ДЛЯ ТЕХ, 
                  КТО НЕ БОИТСЯ САМЫХ 
                  ЭКСТРЕМАЛЬНЫХ МЕТЕО
                   УСЛОВИЙ"
    @en_slogan = "DESIGNED FOR PEOPLE WHO
                ARE USED TO NAVIGATING
                  IN THE MOST EXTREME 
                    CONDITIONS"
    v = {
      name: "REALCRAFT 190",
      modifications_present_text_en: "Realcraft 190 boats can be delivered in several versions of equipment packages of bow cockpit and main cockpit seats",
      modifications_present_text_ru: "Лодки Realcraft 190 могут поставляться в двух модификациях носового кокпита и кресел основного кокпита.",
      slider_images: [
                        "/slider/rc190/1_small.jpg"
                     ],
      design_category: "C",
      slogan_ru: @ru_slogan, 
      slogan_en: @en_slogan, 
      header_description_ru: @ru_head_desc, 
      header_description_en: @en_head_desc, 
      crew_limit: "5#{t :pers_short}",
      length_of_hull: "5.1#{t :m_short}",
      beam_of_hull: "1.76#{t :m_short}",
      max_permitted_load: "500#{t :kg_short}",
      freeboard_thickness: "2#{t :mm_short}",
      hull_thickness: "4#{t :mm_short}",
      max_motor_pwr: "50#{t :hp_short}",
      bot_deadrise_angle: "11˚",
      empty_craft_mass: "347-389#{t :kg_short}",
      videos: [
        "<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/fxN92HTzx4U\" frameborder=\"0\" allowfullscreen></iframe>"
      ],
      modifications: [
                        {
                          name: "BD Comfort",
                          model_view_imgs: model_view_imgs_name.map {|i| {url: "/boat_pages/rc190/comfort/#{i[:url]}", title: i[:title]}},
                          acc_views_imgs: ["/boat_pages/rc190/comfort/acc_1.jpg", "/boat_pages/rc190/comfort/acc_2.jpg"],
                          description_en: "BD means \"BowDeck\" - with bow cockpit closed with removable cover-deck. It modification has three fore lockers and fixed aft locker, which fold out making a comfortable sleeping accommodation.",
                          description_ru: "BD расшифровывается как \"BowDeck\" - с закрытым носовым кокпитом со съёмным люком. Эта модификация снабжена тремя носовыми рундуками и одним кормовым, который раскладываясь образует комфортное спальное место."
                        },
                        {
                          name: "BR Light",
                          model_view_imgs: model_view_imgs_name.map {|i| {url: "/boat_pages/rc190/light/#{i[:url]}", title: i[:title]}},
                          acc_views_imgs: ["/boat_pages/rc190/light/acc_1.jpg", "/boat_pages/rc190/light/acc_2.jpg"],
                          description_en: "BR means \"BowRider\" - With open bow cockpit. It modification has fore swivel seats on support and fixed aft locker.",
                          description_ru: "BR расшифровывается как \"BowRider\" - с открытым носовым кокпитом. Данная модификация снабжена удобными передними поворотными сиденьями и кормовым рундуком."
                        },
                     ]
    }
  end
  
  
  def slider_imgs(imgs) #imgs - это массив содерщий ссылки на фотографии small
    return "" if imgs.blank?
    v = ""
    j=0
    imgs.each do |i|
      next if i.index("small").nil?
      t = "data-interchange=\"[#{i}, small], [#{i.gsub("small", "medium")}, medium], [#{i.gsub("small", "large")}, large], [#{i.gsub("small", "xlarge")}, xlarge]\""
      v += "<li class=\"#{"is-active " if j==0}orbit-slide\">
            <div class = \"rc-slide\" style = \"background-image: url('#{i}');\" #{t}>
            </div>
           </li>"
      j+= 1
    end
    return v
  end
end
