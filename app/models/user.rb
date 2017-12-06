class User < ApplicationRecord
  authenticates_with_sorcery!

  has_and_belongs_to_many :orders

  validates :email, :presence => true,
  					:uniqueness => true,
  					:format => { :with => /@/ }

  validates :password, :presence => true,
  					   :confirmation => true
end
