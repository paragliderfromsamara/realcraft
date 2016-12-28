module ServiceFunctionsHelper
	def is_dev? #проверка на режим разработки
    request.subdomains.first == 'dev' && $enable_dev
  end
  def cur_locale #текущая локаль
       I18n.locale
  end
  
  def need_render_wait_page?
    ((!$enable_en_locale && cur_locale.to_s == "en") || (!$enable_ru_locale && cur_locale.to_s == "ru") ) && !is_dev?
  end
end
