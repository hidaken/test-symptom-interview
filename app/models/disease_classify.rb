class DiseaseClassify < ActiveRecord::Base
    has_many :classify_relations
    has_many :diseases, through: :classify_relations
end
