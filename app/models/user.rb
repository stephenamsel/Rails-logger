class User < ActiveRecord::Base
#VALID_PHRASE = /\A[a-zA-Z0-9\s]+\Z/i #/\A[\sa-z0-9]+\Z/i

validates :name, presence: true, uniqueness: true#, format: { with: VALID_PHRASE }
validates :password, presence: true, length: { minimum: 8 } 
  #what gets sent to the database is an encrypted version so SQL injection is not an issue with this 

has_secure_password
has_many :loans

end
