class DiseaseSymptom < ActiveRecord::Base
    
    validates :disease_id, presence: true
    validates :symptom_id, presence: true
    validates :plr, numericality:{greater_than_or_equal_to: 0, less_than_or_equal_to: 3}
    
    
    belongs_to :disease
    has_many :frequency_points, through: :disease
    belongs_to :symptom
    
    scope :symptom_selected, -> (symptom){where("symptom_id = ?", symptom.id)}
    
    
    def self.search_plr(disease_id, symptom_id)
        if self.find_by(disease_id: disease_id, symptom_id: symptom_id) != nil
            self.find_by(disease_id: disease_id, symptom_id: symptom_id).plr
        end
    end
    
    

end
