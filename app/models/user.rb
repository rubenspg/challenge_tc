class User < ActiveRecord::Base
  has_many :events

  validates :name, presence: true
  validates :email, uniqueness: true

  before_create do |doc|
    doc.api_key = doc.generate_api_key
  end

  def generate_api_key
    SecureRandom.base64.tr('+/=', 'Qrt')
  end

  def make_admin!
    self.update_attribute(:admin, true)
  end
end
