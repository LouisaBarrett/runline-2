class Authentication < ActiveRecord::Base
  validates :provider, :presence => true
  validates :uid, :presence => true
  validates :token, :presence => true
  # validates :secret, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
end
