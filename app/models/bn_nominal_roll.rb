class BnNominalRoll < ApplicationRecord
    has_many :bn_lmc_pers, dependent: :delete_all
		has_one :coy_leave_detail, dependent: :destroy
end
