class IndlDetail < ApplicationRecord
    belongs_to :bn_nominal_roll
    validates :bn_nominal_roll_id, uniqueness: { case_sensitive: false }, presence: true
end
