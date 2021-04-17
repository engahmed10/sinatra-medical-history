class Procedure < ActiveRecord::Base

    belongs_to :disease
    belongs_to :member
    
end
