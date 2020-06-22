class User < ActiveRecord::Base
    has_secure_password
    has_many :members
    validates :username, uniqueness:true
    validates :email ,presence:true
    validates :username, presence: true



    
end