# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
    has_secure_password validations: false
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true
    validates :email, presence: true
end
