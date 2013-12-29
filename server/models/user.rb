class User < ActiveRecord::Base

  validates :uid,            presence: true, uniqueness: { scope: :provider }
  validates :provider,       presence: true
  validates :provider_id,    presence: true
  validates :role,           presence: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth['uid']
      user.provider = auth['provider']
      user.provider_id = auth['info']['nickname']
      user.role = "members"
    end
  end
end
