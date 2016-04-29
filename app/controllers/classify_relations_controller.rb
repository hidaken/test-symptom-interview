class ClassifyRelationsController < ApplicationController
    before_action :set_classify_relation, only: [:edit, :update, :destroy]
    
    def create
        @classify_relation = ClassifyRelation.new(classify_relation_params)
        if @classify_relation.save
            flash[:success] ="症状を追加しました"
            redirect_to disease_path(@classify_relation.disease_id)
        else
            flash[:danger]="症状登録に失敗しました"
            render 'edit'
        end
    end
    
    def destroy
      return redirect_to root_url if @classify_relation.nil?
      @classify_relation.destroy
      flash[:success]="分類が削除されました"
      redirect_to request.referrer || root_url
    end
    
private
    def classify_relation_params
        params.require(:classify_relation).permit(:disease_id, :disease_classify_id)
    end
    
    def set_classify_relation
        @classify_relation = ClassifyRelation.find(params[:id])
    end
end