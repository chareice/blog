class User < ActiveRecord::Base
    has_secure_password validations: false
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true
    validates :email, presence: true


    def self.auth(email, password)
        user = User.find_by email: email
        if user and user.authenticate(password)
            true
        else
            false
        end
    end
end
