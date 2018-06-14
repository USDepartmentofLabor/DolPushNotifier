class DeviceToken < ApplicationRecord
  audited
  validates :app_id, presence: true
  validates :token, presence: true
end
