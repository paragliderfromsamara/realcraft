module ServiceFunctionsHelper
  def opposite_locale_url
    v = cur_locale == :ru ? [".ru", ".com"] : [".com", ".ru"]
    return request.url.gsub(v[0], v[1])
  end
  
  def is_dev? #проверка на режим разработки
    request.subdomains.first == 'dev'
  end
  def cur_locale #текущая локаль
       I18n.locale
  end
  
  def is_ru?
    cur_locale == :ru
  end
  
  def is_com?
    cur_locale == :com
  end
  
  def opposite_locale
    cur_locale == :ru ? :en : :ru
  end
  
  def is_enabled_locale? 
    (cur_locale == :ru and $enable_ru_locale) || (cur_locale == :en and $enable_en_locale)
  end
  
  
  def is_all_locales_enabled?
    $enable_en_locale and $enable_ru_locale || is_dev?
  end 
  
  def need_render_wait_page?
    (!$enable_ru_locale and !$enable_en_locale) and !is_dev?
  end
end
