class DiseaseSymptomsController < ApplicationController
    before_action :set_disease_symptom, only: [:edit, :update, :destroy]
    
    
    def index
        #検索条件による絞込で対象となるdisease_idを配列化。
        @q = Disease.my_diseases(current_user).search(params[:q])
        @diseases_searched = @q.result.map(&:id)
        @diseases_searched.push(0) if @diseases_searched.empty?
        @symptomids = Array.new
        @symptomnames = Array.new
        @month = Date.today.month
        @symptoms_for_select = Symptom.symptom_category_name_and_symptom_name
        
    #症状を選んだ場合    
        if params[:symptom] != nil
    
            # SQLの検索、及びVIEWselectタグの再セットにex利用
            #　入力項目を優先。
            params[:symptom].values.reject(&:empty?).each_with_index do |value,i|
                @symptomids[i] = value.to_i
            end
            @categorise = params[:q][:categorises_id_eq]
            
            unless @categorise.empty?
                @symptom_from_categorise = CategoriseSymptomRelation.where(categorise_id: @categorise).includes(:symptom)
                
                @symptom_from_categorise.reverse_each do |s|
                    @symptomids.unshift(s.symptom_id)
                end
            end
            
            #重複の削除
            @symptomids.delete(0)
            @symptomids.uniq!
            #名前の検索
            @symptomnames = Symptom.where(id: @symptomids).pluck(:symptom_name)


            if params[:age].empty?
                @age = 40
            elsif 
                @age = params[:age].to_i
            end
            
            if params[:sex].empty?
                @sex = "0"
            else
                @sex = params[:sex]
            end

            if params[:month].empty?
                @month = Date.today.mon
            else
                @month = params[:month].to_i
            end
                
            @diseases,@point_total = DispDisease.find_by(@diseases_searched,@symptomids,current_user,@age,@sex,@month)
            flash[:danger] ="データは存在しません" if @diseases.empty?
            
        end
 
    end
    
    def edit
    end
    
    def new
        @disease_symptom = DiseaseSymptom.new(disease_id: params[:disease_id])
    end
    
    
    def create
        @disease_symptom = DiseaseSymptom.new(disease_symptom_params)
        begin
            @disease_symptom.save
            flash.now[:success] ="症状を追加しました"
            @symptoms = DiseaseSymptom.where(disease_id: params[:disease_symptom][:disease_id]).joins([:symptom,symptom: :symptom_category]).includes([:symptom, symptom: :symptom_category]).order("plr desc")
        rescue => e
            flash.now[:danger]="alert('#{e.message}')"
            render 'new' and return
        end
    end
    
    def update

        if @disease_symptom.update(disease_symptom_params)
          #保存に成功した場合は病気詳細へリダイレクト
          #redirect_to disease_path(@disease_symptom.disease_id)
          flash[:info] = "症状を更新しました"
          @disease = Disease.find_by(id: params[:disease_symptom][:disease_id])
          @symptoms = @disease.disease_symptoms.joins([:symptom,symptom: :symptom_category]).includes([:symptom, symptom: :symptom_category]).order("plr desc")
        else
          #保存に失敗した場合は編集画面にもどす
          flash.now[:danger] = "保存に失敗しました"
          render 'edit'

        end
    end
    
    def destroy
        return redirect_to root_url if @disease_symptom.nil?
        @disease_symptom.destroy
        flash[:success]="症状が削除されました"
        redirect_to request.referrer || root_url
    end
    
private
    def disease_symptom_params
        params.require(:disease_symptom).permit(:disease_id, :symptom_id, :plr, :description, :relation_point)
    end
    
    def set_disease_symptom
        @disease_symptom = DiseaseSymptom.find(params[:id])
    end
end
