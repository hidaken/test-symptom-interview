class CategoriseDiseaseRelation < ActiveRecord::Base
    #病気マスタ及び主訴カテゴライズへの従属関連性
    belongs_to :disease
    belongs_to :categorise
    has_many :large_categorises ,through: :categorise
end
