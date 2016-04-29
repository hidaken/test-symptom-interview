class CategoriseDiseaseRelationsController < ApplicationController
  
  before_action :set_categorise_disease, only: [:edit, :update, :destroy]
  def new
    @categorise_disease = CategoriseDiseaseRelation.new(disease_id: params[:disease_id])
  end

  def edit
  end
  
  def create
    @categorise_disease = CategoriseDiseaseRelation.new(categorise_disease_params)
    if @categorise_disease.save
        flash[:success] ="#{@categorise_disease.disease.name}のカテゴライズを追加しました"
        redirect_to disease_path(@categorise_disease.disease_id)
    else
        flash[:danger]="#{@categorise_disease.disease.name}のカテゴライズ登録に失敗しました"
        render 'edit'
    end
  end
  def update
    if @categorise_disease.update(categorise_disease_params)
      #保存に成功した場合は病気詳細へリダイレクト
      redirect_to disease_path(@categorise_disease.disease_id)
      flash[:info] = "症状を更新しました"
    else
      #保存に失敗した場合は編集画面にもどす
      flash.now[:danger] = "保存に失敗しました"
      render 'edit'

    end
  end
    
  def destroy
      return redirect_to root_url if @categorise_disease.nil?
      @categorise_disease.destroy
      flash[:success]="カテゴライズが削除されました"
      redirect_to request.referrer || root_url
  end
    
private
    def categorise_disease_params
        params.require(:categorise_disease_relation).permit(:disease_id, :categorise_id)
    end
    
    def set_categorise_disease
        @categorise_disease = CategoriseDiseaseRelation.find(params[:id])
    end
end
