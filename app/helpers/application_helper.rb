module ApplicationHelper
  
  def main_page_slider_imgs #изображения слайдера с главной страницы
    [
      "/slider/index/1_small.jpg",
      "/slider/index/2_small.jpg"
    ]
  end
  
  
  def rc_header(big, small = nil, small_bot = nil)
    v = ""
    v += "<h3>#{small}</h3>" if !small.nil? 
    v += "<h1>#{big}</h1>"
    v += "<h4>#{small_bot}</h4>" if !small_bot.nil? 
    return "<div id = \"rc-header\">#{v}</div>".html_safe
  end
  
  def real_craft_190
    {
      name: "REALCRAFT 190",
      design_category: "C",
      slogan: "DESIGNED FOR PEOPLE WHO
                RE USED TO NAVIGATING
                  IN THE MOST EXTREME 
                    CONDITIONS",
      header_description: "Realсraft 190 can provide you a wide range of leisure
activities on the water. Increased main cockpit, wide
passage to the front cockpit, level floor, spacious units 
for storage of anchors, halyards, fenders and other
things, shelves for spinning and fishing rods along the 
boards make Realсraft 190 a great boat for enthusiastic 
fishermen."
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
