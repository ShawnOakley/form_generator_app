class User < ActiveRecord::Base
  attr_accessible :username, :user_email, :password
  attr_reader :password

  validates_uniqueness_of :user_email
  validates_uniqueness_of :username
  validates_presence_of :username, :user_email
  validates :password_hash, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }

  after_initialize :ensure_session_token

  has_many(
  :forms,
  foreign_key: :owner_id,
  primary_key: :id)

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    if !user.nil?
      user.is_password?(password) ? user : nil
    else
      nil
    end
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
