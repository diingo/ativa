class PotentialAdmin < ActiveRecord::Base
  attr_accessible :email, :generated_number

  # we do not wnat repeat customers, this makes sure each email address is unique
  validates :email, :uniqueness => true

  # WRITE THE CODE we want to generate the unique number for each potential admin entry created

  before_create :generate_unique_number

  def generate_unique_number
    number = SecureRandom.hex(3)
    while PotentialAdmin.find_by_generated_number(number)
      number = SecureRandom.hex(3)
    end
    self.generated_number = number
  end

end


