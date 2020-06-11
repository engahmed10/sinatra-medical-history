class User < ActiveRecord::Base
    has_many :members
    has_secure_password
    validates :username ,presence:true
    validates :email, uniqueness:true
    

end