class LargeCategorise < ActiveRecord::Base
    #主訴カテゴライズとの関連性
    belongs_to :categorise
    has_many :categorise_disease_relations ,through: :categorise
    
    scope :id_in, ->(ids){
        where(large_categorise_id: ids) if ids.present?
    }

    
end
