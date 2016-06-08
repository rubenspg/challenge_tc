class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, uniqueness: true

  before_create do |doc|
    doc.api_key = doc.generate_api_key
  end

  def generate_api_key
    token = SecureRandom.base64.tr('+/=', 'Qrt')
    #loop do
  #    token = SecureRandom.base64.tr('+/=', 'Qrt')
  #    break token unless User.exists?(api_key: token).any?
  #  end
  end
end
