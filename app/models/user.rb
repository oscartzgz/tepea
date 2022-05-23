class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :pictures, dependent: :destroy

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    find_or_create_by(email: email) do |user|
      user.uid = uid,
      user.full_name = full_name
      user.avatar_url = avatar_url
    end
  end
end
