class BnNominalRoll < ApplicationRecord
    has_many :bn_lmc_pers, dependent: :delete_all
		has_one :coy_leave_detail, dependent: :destroy
    has_many :bn_punishment_pers, dependent: :delete_all
    has_many :ere_details, dependent: :delete_all
    has_many :pers_in_mhs, dependent: :delete_all
end
