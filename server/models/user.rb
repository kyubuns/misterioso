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
        name: auth['info']['name'],

        # dummy datas
        max_ap: 30,
        ap:     30,
        money:  0,
        power:  0,
      })
    end
  end
end
