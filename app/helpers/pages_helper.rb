module PagesHelper
  def production_photos(ph_name, preview_size = "small")
    path_name = "/production_photos"
    return {url: "#{path_name}/#{ph_name}_#{preview_size}.jpg", list: "[#{path_name}/#{ph_name}_small.jpg, small], [#{path_name}/#{ph_name}_medium.jpg, medium], [#{path_name}/#{ph_name}_large.jpg, large], [#{path_name}/#{ph_name}_xlarge.jpg, xlarge]"}
  end
  
  def dealers_page_content
    [
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
    [
        {
          #wrapper_bg_image: "boat_2_small.jpg",
          #fog_class: "hard-fog dark-blue-bg",
          row_class: "tb-pad-m medium-font",
          columns: [
                      {
                        #3-й абзац
                        col_class: "small-12 text-center medium-font",
                        ru_content: %{Поскольку только недавно мы получили CE-сертификаты, мы пока еще не имеем дилеров в ЕС.},
                        en_content: %{Because we received CE -certificates only recently, we have no dealers in EU yet.}
                      }
                   ]
        },
        {
          wrapper_bg_image: "boat_2_small.jpg",
          fog_class: "hard-fog dark-blue-bg",
          row_class: "tb-pad-m medium-font white-font",
          columns: [
                      {
                        #3-й абзац
                        col_class: "small-12 medium-5 text-center",
                        ru_content: %{Поскольку такая покупка может показаться хлопотной,  до тех пор, пока в вашей стране  не появится удобный для Вас дилер, мы предлагаем особые цены для наших покупателей из Европы.},
                        en_content: %{Since such a purchase may seem troublesome, until we have no dealer convenient for you in our country, we offer special prices for our customers from Europe.}
                      },
                      {
                        #4-й абзац
                        col_class: "small-12 medium-6 medium-offset-1 text-center",
                        ru_content: %{Мы можем доставить лодку непосредственно на ваше место, но, к сожалению, это достаточно дорого.  Поэтому мы предлагаем передать вам лодку в Российской Федерации около таможенного пункта пропуска на удобной для вас границе с Евросоюзом.},
                        en_content: %{We can deliver the boat directly to your place, but, unfortunately, it is quite expensive. Therefore, we propose to give you a boat in the Russian Federation near the customs checkpoint at a convenient border with the European Union.}
                      }
                   ]
        },
        {
          #wrapper_bg_image: "boat_3_small.jpg",
          #fog_class: "hard-fog white-bg",
          wrapper_class: "blue-bg",
          row_class: "tb-pad-m large-font",
          columns: [
                      {
                        col_class: "small-12 medium-10 medium-centered text-center",
                        ru_content: %{от <span class = "stat">7000</span> ЕВРО за лодку},
                        en_content: %{from about <span class = "stat">7000</span> EUR for a high quality boat...}
                      }
                   ]
        },
        {
          wrapper_bg_image: "boat_3_small.jpg",
          fog_class: "hard-fog white-bg",
          row_class: "tb-pad-m large-font",
          columns: [
                      {
                        #5-й абзац
                        col_class: "small-12 medium-10 medium-centered text-center",
                        ru_content: %{С учетом  предлагаемых скидок к нашим ценам в России вы получаете возможность приобрести катер по уникальной цене – от  7000 ЕВРО за лодку высокого качества с длиной корпуса 5,1 метра, несравнимо меньшей, чем цена других предлагаемых в Европе лодок соответствующей категории.},
                        en_content: %{Taking into account the offered discounts to our prices in Russia, you get the opportunity to purchase a boat at a unique price, incomparably less than the price of other boats of the corresponding category offered in Europe - from about 7000 EUR for a high quality boat with a hull length of 5.1 meters.}
                      }
                   ]
        },
        {
          #wrapper_bg_image: "boat_3_small.jpg",
          #fog_class: "hard-fog white-bg",
          wrapper_class: "dark-blue-bg",
          row_class: "tb-pad-s large-font",
          columns: [
                      {
                        #5-й абзац
                        col_class: "small-12 medium-10 medium-centered text-center",
                        ru_content: %{Если Вы хотите приобрести лодку, напишите нам на почту #{mail_to "info@realcraftboats.com"}, <br /> или заполните заявку <a data-form-in-price>здесь</a>},
                        en_content: %{If you want to purchase a boat, write us #{mail_to "info@realcraftboats.com"} <br /> or fill a boat request form <a data-form-in-price>here</a>}
                      }
                   ]
        },
        {
          #wrapper_bg_image: "boat_3_small.jpg",
          #fog_class: "hard-fog white-bg",
          wrapper_class: "dark-blue-bg",
          row_class: "tb-pad-s medium-font",
          columns: [
                      {
                        #5-й абзац
                        col_class: "small-12 medium-7 medium-centered text-center",
                        ru_content: %{Мы гарантируем высокое качество катеров, соблюдение договорных положений о поставках и гарантии.},
                        en_content: %{We guarantee the high quality of boats, compliance with contractual provisions for supplies and guarantees.}
                      }
                   ]
        }
    ]
  end
end
