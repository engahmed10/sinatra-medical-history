class Member < ActiveRecord::Base
    has_many :histories
    has_many :diseases, through: :history
    has_many :procedure
    belongs_to :user
end
