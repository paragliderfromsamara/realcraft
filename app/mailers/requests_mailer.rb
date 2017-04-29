class RequestsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.requests_mailer.boat_request.subject
  #
  def boat_request(request)
    @request = request
    mail(to: "info@realcraftboats.com", :subject => "Заявка на лодку") do |format| #"info@realcraftboats.com"
      format.text
      format.html
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.requests_mailer.dealer_request.subject
  #
  def dealer_request(request)
    @request = request
    mail(to: "info@realcraftboats.com", :subject => "Заявка на дилерство") do |format| #"info@realcraftboats.com"
      format.text
      format.html
    end
  end
end
