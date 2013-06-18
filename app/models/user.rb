class User < ActiveRecord::Base
  attr_accessible :email

  validates :email, presence: true

  has_many :notes
end
