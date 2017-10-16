class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.name,
      email: auth_hash.info.email,
      image_url: auth_hash.info.image,
      oauth_token: auth_hash.credentials.token,
      oauth_expires_at: auth_hash.credentials.expires_at
    )
    user
  end
end
