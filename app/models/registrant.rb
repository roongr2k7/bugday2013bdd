class Registrant < ActiveRecord::Base
  attr_accessible :name, :email

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/ }

end
