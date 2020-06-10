class History < ActiveRecord::Base
    belongs_to :member
    belongs_to :disease
end
