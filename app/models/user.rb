class User < ActiveRecord::Base
    has_many :members
    validates :username ,presence:true
    validates :email, uniqueness:true
    

end