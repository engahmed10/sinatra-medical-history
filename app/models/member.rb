class Member < ActiveRecord::Base
    belongs_to :user
    has_many :histories
    has_many :diseases, through: :history
    has_many :procedures
    
end
