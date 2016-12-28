module ServiceFunctionsHelper
	def is_dev? #проверка на режим разработки
    request.subdomains.first == 'dev'
  end
  def cur_locale #текущая локаль
       I18n.locale
  end
  
  def need_render_wait_page?
    !$enable_en_locale #((cur_locale == "ru" && !$enable_ru_locale) || (cur_locale == "en" && !$enable_en_locale) ) and !is_dev?
  end
end
