class User < ActiveRecord::Base
  attr_accessible :username, :user_email, :password
  attr_reader :password

  validates_uniqueness_of :user_email
  validates_presence_of :username, :user_email
  validates :password_hash, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end


end
