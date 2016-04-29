class DispDisease
    include ActiveAttr::Model
 
    attribute :disease_id
    attribute :disease_name
    attribute :onset
    attribute :localization
    attribute :importance
    attribute :morbidity_baby
    attribute :morbidity_child
    attribute :morbidity_adult
    attribute :morbidity_senior
    attribute :morbidity_male
    attribute :morbidity_female
    attribute :seasonality12to2
    attribute :seasonality3to5
    attribute :seasonality6to8
    attribute :seasonality9to11
    attribute :point
    attribute :season_point
    attribute :age_point
    attribute :sex_point
    attribute :total
    attribute :plrarray
    attribute :classify_name
    attribute :pri_prob
    attribute :post_prob
    attribute :point_total

  
  
  def self.find_by(result,symptomids,current_user,age,sex,month)
    dispdiseases = Array.new
    point_total = 0
    diseases = Disease.symptom_selected(result,symptomids,current_user)
    
    n = symptomids.count

    diseases.each do |ds|
        dispdisease = DispDisease.new
        
        dispdisease.disease_id = ds.id
        dispdisease.disease_name = ds.name
        dispdisease.onset = ds.onset
        dispdisease.localization = ds.onset
        dispdisease.importance = ds.localization
        dispdisease.morbidity_baby = ds.morbidity_baby
        dispdisease.morbidity_child = ds.morbidity_child
        dispdisease.morbidity_adult = ds.morbidity_adult
        dispdisease.morbidity_senior = ds.morbidity_senior
        dispdisease.morbidity_male = ds.morbidity_male
        dispdisease.morbidity_female = ds.morbidity_female
        
        dispdisease.point = ds.point
        
        dispdisease.plrarray = Array.new
        i = 0
        until i >= n
            dispdisease.plrarray.push(eval("ds.plr#{i}"))
            i += 1
        end
      
#計算ロジック
    #季節判定
        
        if month <= 2 || month == 12
            dispdisease.season_point = ds.seasonality12to2
        elsif month >=3 && month <= 5
            dispdisease.season_point = ds.seasonality3to5
        elsif month >=6 && month <= 8
            dispdisease.season_point = ds.seasonality6to8
        elsif month >=9 && month <= 11
            dispdisease.season_point = ds.seasonality9to11
        end
        #対数補正
        dispdisease.season_point = dispdisease.season_point/ 0.25
        
    #年齢判定
        if age <= 6
            dispdisease.age_point = ds.morbidity_baby
        elsif age >= 7 && age <= 17
            dispdisease.age_point = ds.morbidity_child
        elsif age >= 18 && age <= 59
            dispdisease.age_point = ds.morbidity_adult
        elsif age >= 60 && age <= 99
            dispdisease.age_point = ds.morbidity_senior
        else
            dispdisease.age_point = 1
        end
        #対数補正
        dispdisease.age_point = dispdisease.age_point/ 0.25
    
    #続いて性別判定
        if sex == "0"
            dispdisease.sex_point = ds.morbidity_male
        elsif sex == "1"
            dispdisease.sex_point = ds.morbidity_female
        end
        dispdisease.sex_point = dispdisease.sex_point/ 0.5
      
    
    #合計点数の計算  
        #nilの除去
        temporary_array = dispdisease.plrarray.compact
        #配列の合計（症状plrの合計値算出）
        plr_sum_total = temporary_array.inject(0) { |sum, i| sum + i }
        #事前確率の計算
        dispdisease.total = dispdisease.point**2 * dispdisease.age_point * dispdisease.sex_point * dispdisease.season_point
        dispdisease.total = dispdisease.total.round(2)
        point_total += dispdisease.total
        dispdiseases.push(dispdisease)
    end
    #事前確率、及び症状尤度比による事後確率の計算
    dispdiseases.each do |ds|
        #事前確率の算出
        ds.pri_prob = ds.total / point_total
        x = ds.pri_prob
        ds.plrarray.each do |plr|
            #尤度比得点を実際のPLRに変換。
            lr = 0.5 if plr.nil?
            lr = 1 if plr == 0
            lr = 2 if plr == 1
            lr = 5 if plr == 2
            lr = 10 if plr == 3
            x = (x/(1-x)*lr)/(1+(x/(1-x)*lr))
        end
        ds.post_prob = x
        
    end
    
    dispdiseases = dispdiseases.sort_by{|ds| ds.point}.sort_by{|ds| ds.post_prob}.reverse
    return dispdiseases,point_total
  end
  
  
end