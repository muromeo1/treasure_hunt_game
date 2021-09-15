class TreasureHuntMailer < ApplicationMailer
  def congratulations
    @treasure_location = params[:treasure_location]&.join(', ')
    @nth_found = params[:nth_found]&.ordinalize
    email = params[:email]

    mail(to: email, subject: 'Congratulations!')
  end
end
