# Preview all emails at http://localhost:3000/rails/mailers/requests_mailer
class RequestsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/requests_mailer/boat_request
  def boat_request
    RequestsMailer.boat_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/requests_mailer/dealer_request
  def dealer_request
    RequestsMailer.dealer_request
  end

end
