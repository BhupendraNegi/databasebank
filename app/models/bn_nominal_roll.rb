class BnNominalRoll < ApplicationRecord
    has_many :bn_lmc_pers, dependent: :delete_all
		has_one :coy_leave_detail, dependent: :destroy
    has_many :bn_punishment_pers, dependent: :delete_all
    has_many :ere_details, dependent: :delete_all
    has_many :pers_in_mhs, dependent: :delete_all
    has_many :bn_sports_teams, dependent: :delete_all
    has_many :army_courses, dependent: :delete_all
    has_many :att_pers, dependent: :delete_all
    has_many :indl_veh_details, dependent: :delete_all
    has_one :indl_detail, dependent: :destroy
    has_many :awards_and_achievements, dependent: :delete_all
    has_one :cor_drinker_non_drinker, dependent: :destroy
    has_one :leave_state, dependent: :destroy
    has_one :max_health_report, dependent: :destroy
    has_one :bn_family_member_detail, dependent: :destroy

    def self.ransackable_attributes(auth_object = nil)
      column_names + _ransackers.keys
    end
    
    def self.ransackable_associations(auth_object = nil)
      reflect_on_all_associations.map { |a| a.name.to_s }
    end
end
