class User < ApplicationRecord
  has_secure_password

  has_many :location_histories

  def found_the_treasure
    update(
      treasure_found: true,
      nth_found: found_position + 1
    )
  end

  private

  def found_position
    User.select(:id).where(treasure_found: true).size
  end
end
