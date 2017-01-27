class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ServiceFunctionsHelper
  protect_from_forgery with: :exception
  before_action :set_locale 
  before_action :check_waiting_page
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end
  
  def check_waiting_page
    if need_render_wait_page?
      render "pages/please_wait", layout: false 
    elsif !is_enabled_locale?
        redirect_to opposite_locale_url if !is_dev?
    end
  end
  # Получаем локаль из домена верхнего уровня или возвращаем nil, если такая локаль недоступна
  # Вам следует поместить что-то наподобие этого:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  # в ваш файл /etc/hosts, чтобы попробовать это локально

  private
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
  

end
