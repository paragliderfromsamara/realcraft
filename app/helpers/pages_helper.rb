module PagesHelper
  def production_photos(ph_name, preview_size = "small")
    path_name = "/production_photos"
    return {url: "#{path_name}/#{ph_name}_#{preview_size}.jpg", list: "[#{path_name}/#{ph_name}_small.jpg, small], [#{path_name}/#{ph_name}_medium.jpg, medium], [#{path_name}/#{ph_name}_large.jpg, large], [#{path_name}/#{ph_name}_xlarge.jpg, xlarge]"}
  end
  
  def dealers_page_content
    [
        {
          #1-й абзац
          row_class: "tb-pad-s",
          columns: [
                       {
                          ru_content: %{Самарский завод моторных лодок «Салют» выпускает лучшие лодки в России уже более 12 лет. Мы зарегистрировали в Европе нашу новую торговую марку REALCRAFT® и провели сертификацию двух катеров, разработанных нами специально для Европы на базе проверенных и хорошо испытанных моделей.},
                          en_content: %{Samara Motor-Boat Plant «Salut» has been producing the best boats in Russia for more than 12 years. We've registered in Europe our new trademark REALCRAFT® and certified two boats, designed specifically for Europe on the basis of proven and well-tested models.}
                        }
                   ] 
        },
        {
          wrapper_bg_image: "boat_test_top_1_small.jpg",
          fog_class: "hard-fog white-bg",
          row_class: "tb-pad-l",
          columns: [
                      {
                        #2-й и 3-й абзацы
                        col_class: "small-6",
                        ru_content: %{Сертификацию проводила одна из крупнейших и уважаемых в Европе финская фирма VTT.<br /><br /> CE-сертификаты получены нами только недавно, нашим лодкам открыт путь для поставок в Европу. Мы ищем дилеров для продвижения и продажи лодок в Европе.},
                        en_content: %{Certification was conducted by one of the largest and most respected Finnish company VTT. <br /><br /> CE-certificates have been received only recently and our boats have opened the way for deliveries to Europe. We are looking for dealers to promote and sell boats in Europe.}
                      },
                      {
                        col_class: "small-6",
                        content: link_to(image_tag("/files/vtt_logo.png", class: "float-center").html_safe, "http://www.vttexpertservices.com/", target: "_blank")
                      }
                   ]
        },
        {
          row_class: "tb-pad-m",
          columns: [
                        {
                          #4-й абзац
                          col_class: "small-6",
                          ru_content: %{Мы предлагаем выгодные условия поставки, гарантируем высокое качество катеров, соблюдение договорных положений о поставках и гарантии.},
                          en_content: %{We offer favorable terms of delivery and prices, guarantee high quality of boats, compliance with contractual terms for supplies and guarantees.}
                        },
                        {
                          #5-й абзац
                          col_class: "small-6",
                          ru_content: %{Предлагаемые нами условия позволят приобрести в Европе лодку высокого качества по самой привлекательной цене с учетом  интереса дилера.},
                          en_content: %{Our offer will allow to purchase a high quality boat in Europe at the most attractive price, taking into account the dealer's interest.}
                        }
                   ] 
        },
        {
          wrapper_class: "blue-block",
          row_class: "tb-pad-m",
          columns: [
                       {
                         #6-й абзац
                          col_class: "small-12 text-center medium-font", 
                          ru_content: %{Для первых – пробных поставок предусмотрены специальные условия.},
                          en_content: %{For the first - trial delivery special conditions are provided.}
                        }
                   ] 
        },
        {
          wrapper_class: "blue-bg",
          wrapper_bg_image: "boat_1_small.jpg",
          fog_class: "hard-fog dark-blue-bg",
          row_class: "tb-pad-l",
          columns: [
                       {
                         #7-й абзац
                         col_class: "small-12 text-center medium-font",
                         ru_content: %{Если Вы хотите стать нашим дилером, напишите нам на почту #{mail_to "info@realcraftboats.com"}, и мы вышлем вам необходимую информацию.},
                         en_content: %{If you want to become our dealer, write us #{mail_to "info@realcraftboats.com"}, and we'll send you the necessary information.}
                        }
                   ] 
        }
    ]
  end
  
  def prices_page_content
  end
end
