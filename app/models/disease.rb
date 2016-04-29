class Disease < ActiveRecord::Base
    validates :name, presence: true
    validates :morbidity_baby,:morbidity_child,:morbidity_adult,:morbidity_senior,:morbidity_male,:morbidity_female, numericality: true
    
    #enum で定義してみたが、いろいろバグったので結局使っていない
    #enum importance:{no: 0, yes: 1 }
    
    #病気と症状の関連性
    has_many :disease_symptoms, dependent: :destroy
    has_many :symptoms, through: :disease_symptoms
    has_many :symptom_categories, through: :symptoms
    
    #病気分類の関連性
    has_many :classify_relations, dependent: :destroy
    has_many :disease_classifies, through: :classify_relations

    
    #基礎点数の関連性
    has_many :frequency_points, dependent: :destroy
    accepts_nested_attributes_for :frequency_points
    
    #主訴カテゴライズの関連性
    has_many :categorise_disease_relations, dependent: :destroy
    has_many :categorises, through: :categorise_disease_relations
    has_many :large_categorises, through: :categorises
    
    #病気同士の関連性
    has_many :disease_froms, class_name:"Disease", foreign_key: "disease_from_id", dependent: :destroy
    has_many :influencing_diseases, through: :disease_froms, source: :disease_from
    has_many :disease_tos, class_name:"Disease", foreign_key: "disease_to_id", dependent: :destroy
    has_many :influencing_diseases, through: :disease_tos, source: :disease_to



    scope :my_diseases, -> (current_user){includes(:frequency_points)
                          .where("frequency_points.department_id = ?", current_user.department_id)
                          .order("frequency_points.point DESC, name")}
                          
    

    def self.symptom_selected(result,symptomids, current_user)
        sql = ""
        sql += 
            "select diseases.*, my_points.point,"
                
    symptomids.each_index do |i|
        sql +=  "symptom_#{i}.plr as plr#{i},"
    end
    sql.chop!
        
            
        sql +=  " from diseases "
        
    symptomids.each_with_index do |id,i|
        sql +=
            "left join
                (select * from disease_symptoms 
                 where disease_symptoms.symptom_id = #{id}
                 )symptom_#{i} 
            on 
                diseases.id = symptom_#{i}.disease_id "
    end
        sql +=        
            "left join
                (select * from frequency_points
                where frequency_points.department_id = #{current_user.department_id}
                )my_points
            on 
                diseases.id = my_points.disease_id
            where
                diseases.id in (#{result.join(",")})
    
            order by "
    
    symptomids.each_with_index do |id,i|
        sql += "symptom_#{i}.plr desc,"
    end
    
        sql += " my_points.point desc;"

            
            diseases = Disease.find_by_sql(sql)
            return diseases
        
    end
    
    
end
