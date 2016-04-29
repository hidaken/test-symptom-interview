class SymptomCategory < ActiveRecord::Base
    
    #症状分類関連
    has_many :symptoms
    
end
