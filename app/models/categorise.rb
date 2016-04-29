class Categorise < ActiveRecord::Base
    #病気テーブルとの関連性
    has_many :categorise_disease_relations
    has_many :diseases ,through: :categorise_disease_relations
    
    #主訴カテゴライズ分類との関連性（1つのカテゴライズが複数の分類に仕分けされる）
    has_many :large_categorises
    
    #カテゴライズと症状の紐付け
    has_many :categorise_symptom_relations
    has_many :symptoms ,through: :categorise_symptom_relations
end
