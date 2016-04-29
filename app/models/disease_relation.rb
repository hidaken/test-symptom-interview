class DiseaseRelation < ActiveRecord::Base
    belongs_to :disease_from, class_name: "Disease"
    belongs_to :disease_to, class_name: "Disease"
end
