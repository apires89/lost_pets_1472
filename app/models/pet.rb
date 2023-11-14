class Pet < ApplicationRecord
  #name, species, found_on , address
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :species, inclusion: { in: %w(dog cat bear),
    message: "%{value} is not a valid specie" }

  def day_ago
    (Date.today - found_on).to_i
  end

end
