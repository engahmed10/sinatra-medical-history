class Member < ActiveRecord::Base

    belongs_to :user
    has_many :histories
    has_many :diseases, through: :history
    has_many :procedures
    #has_many :diseases, through: :procedure

    validates :order_age, presence: true
    validates :name, presence: true
    validates :kinship, presence: true
    
end

