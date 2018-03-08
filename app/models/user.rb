class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :articles, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  # def self.find_or_create_from_auth_hash(auth_hash)
  #   user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
  #   user.update(
  #     name: auth_hash.info.name,
  #     email: auth_hash.info.email,
  #     image_url: auth_hash.info.image,
  #     oauth_token: auth_hash.credentials.token,
  #     oauth_expires_at: auth_hash.credentials.expires_at
  #   )
  #   user
  # end

  validates :name, length: { maximum: 15 }

  before_save :validate_username
  before_create :validate_username


  def self.from_omniauth(auth)
    # First validates if exists user with provider and uid
      where(email: auth.info.email).first_or_create do |user|
        user.uid = auth.uid
        user.provider = auth.provider
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
  end


  private 
    def set_username
      date = Date.today.strftime('%m%d')
      time = Time.now
      new_name = 'usuario' + time.min.to_s + time.hour.to_s + date
      update_attributes(name: new_name)
    end

    def validate_username
      if self.name.blank? or self.name == nil?
        set_username
      end
    end
end
