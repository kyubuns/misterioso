class User < ActiveRecord::Base

  has_one :character

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
      user.create_character ({
        # dummy datas
        name: auth['info']['name'],
        ap:     10,
        max_ap: 10,
      })
    end
  end
end
