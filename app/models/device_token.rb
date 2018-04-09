class DeviceToken < ApplicationRecord
    validates :app_id, presence: true
    validates :token, presence: true
end
