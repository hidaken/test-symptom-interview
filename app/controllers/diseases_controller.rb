class DiseasesController < ApplicationController
    before_action :set_disease, only: [:update, :destroy]
  
    def index
        @q = Disease.my_diseases(current_user).search(params[:q])
        @diseases = @q.result
    end
    
    def create
    end
    
    def new
    end
    
    def show
        @disease = Disease.find_by(id: params[:id])
        @symptoms = @disease.disease_symptoms.joins([:symptom,symptom: :symptom_category]).includes([:symptom, symptom: :symptom_category]).order("plr desc")
        @categorises = @disease.categorise_disease_relations.includes([:categorise,:large_categorises])
        @classify = @disease.classify_relations.includes(:disease_classify)
        @classify_relation = ClassifyRelation.new
        @categorise_disease_relation = CategoriseDiseaseRelation.new
        #@frequency_point = FrequencyPoint.find_by(department_id: current_user.department_id, disease_id: @disease.id)

    end
    
    def update
        if @disease.update(disease_params)
          #保存に成功した場合はトップページへリダイレクト
          redirect_to disease_path(disease_params)
          flash[:info] = " 保存成功しました"
        else
          #保存に失敗した場合は編集画面にもどす
          render 'show'
          flash[:danger] = "保存に失敗しました"
        end
    end
    
private
  def disease_params
    params.require(:disease).permit!
    # params.require(:disease).permit(:name, 
    #                                 :onset, 
    #                                 :localization, 
    #                                 :importance, 
    #                                 :morbidity_male, 
    #                                 :morbidity_female, 
    #                                 :morbidity_baby, 
    #                                 :morbidity_child, 
    #                                 :morbidity_adult, 
    #                                 :morbidity_senior,
    #                                 :seasonality3to5,
    #                                 :seasonality6to8,
    #                                 :seasonality9to11,
    #                                 :seasonality12to2,
    #                                 :frequency_points_attributes=>{0=>{:id}})
  end  
  
  def set_disease
    @disease = Disease.find(params[:id])
  end
end
