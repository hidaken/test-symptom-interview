class Symptom < ActiveRecord::Base
    
    #病気-症状関連性
    has_many :disease_symptoms, dependent: :destroy
    has_many :diseases, through: :disease_symptoms
    
    #症状分類との関連性
    belongs_to :symptom_category
    
    #カテゴライズと症状の紐付け
    has_many :categorise_symptom_relations
    has_many :categorises, through: :categorise_symptom_relations
    
    
    
    def self.symptom_category_name_and_symptom_name
        a = self.all.includes(:symptom_category).order(:symptom_category_id)
        symptom_all = Hash.new
        a.each do |sy|
            categoryandname = sy.symptom_category.symptom_category_name + " / " + sy.symptom_name
            symptom_all[sy.id] = categoryandname
        end
        
        return symptom_all
    end
    
end
