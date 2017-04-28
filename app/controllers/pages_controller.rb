class PagesController < ApplicationController
  def index
  end

  def prices
    @title = t(:prices)
  end
  
  def dealers
    @title = t(:dealers)
  end
  
  def about
    @title = t(:about)
  end
  
  def realcraft_190
    @boat = real_craft_190
    @title = @boat[:name]
    @page_image = '/slider/rc190/2_xlarge.jpg'
    @meta_content = @boat["slogan_#{cur_locale}".to_sym]
  end

  def realcraft_200
    @boat = real_craft_200
    @title = @boat[:name]
    @page_image = '/slider/rc200/4_slider_xlarge.jpg'
    @meta_content = @boat["slogan_#{cur_locale}".to_sym]
  end
  
  def send_boat_request
    redirect_to "/404" if params[:boat_request].blank?
    RequestsMailer.boat_request(boat_request_params).deliver_now
    redirect_to prices_path
  end
  
  def please_wait
    #redirect_to root_path if (cur_locale == "ru" && $enable_ru_locale) || (cur_locale == "en" && $enable_en_locale) 
  end
  
  private 
  
  def boat_request_params
    params.require(:boat_request).permit(:name, :email, :boat_name, :comment)
  end
end
