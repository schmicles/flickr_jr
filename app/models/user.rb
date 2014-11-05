class User < ActiveRecord::Base
  has_many  :albums, :dependent => :destroy


  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  def self.valid?(username)
    User.exists?(username: username)
  end

  def authenticate(attempted_password)
    self.password == attempted_password
  end
end
