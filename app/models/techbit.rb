class Techbit < ApplicationRecord
  audited
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :active, presence: true
end
