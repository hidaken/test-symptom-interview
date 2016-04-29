class CategoriseSymptomRelation < ActiveRecord::Base
    belongs_to :symptom
    belongs_to :categorise
end
