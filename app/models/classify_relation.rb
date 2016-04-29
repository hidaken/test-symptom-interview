class ClassifyRelation < ActiveRecord::Base
    belongs_to :disease_classify
    belongs_to :disease
    
end
