class Disease < ActiveRecord::Base
 has_many :procedure
 has_many :histories
 has_many :members, through: :history   
 #has_many :members, through: :procedure   
 
end


