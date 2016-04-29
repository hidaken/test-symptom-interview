class FrequencyPoint < ActiveRecord::Base
#Validation    
    # validates :department_id, presence: true
    # validates :disease_id, presence: true
    validates :point, numericality:{only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
    
#relation 
    #hospitalとのリレーション
    belongs_to :hospital

    #Diseaseテーブルとのリレーション
    belongs_to :disease
    #Classify関連テーブルのリレーション
    has_many :classify_relations, through: :disease
    has_many :disease_classifies, through: :classify_relations
    
    #categorise関連テーブルのリレーション
    has_many :categorise_disease_relations, through: :disease
    has_many :categorises, through: :categorise_disease_relations
    has_many :large_categorises, through: :categorises
    
    #症状系テーブルとのリレーション
    has_many :disease_symptoms, through: :disease
    has_many :symptoms, through: :disease_symptoms
    has_many :symptom_categories, through: :symptoms
    
    
end
