# Preview all emails at http://localhost:3000/rails/mailers/treasure_hunt
class TreasureHuntPreview < ActionMailer::Preview
  def congratulations
    treasure_location = TreasureHunt::LOCATION
    nth_found = 3
    email = 'test@email.com'

    TreasureHuntMailer.with(
      treasure_location: treasure_location,
      nth_found: nth_found,
      email: email
    ).congratulations
  end
end
