require "csv"

CSV.foreach('db/fixtures/data/disease.csv') do |row|
  Disease.create(
      :id => row[0], 
      :name => row[1], 
      :onset => row[2],
      :localization => row[3],
      :importance => row[4],
      :morbidity_baby => row[5],
      :morbidity_child => row[6],
      :morbidity_adult => row[7],
      :morbidity_senior => row[8],
      :morbidity_male => row[9],
      :morbidity_female => row[10],
      :seasonality12to2 => row[11],
      :seasonality3to5 => row[12],
      :seasonality6to8 => row[13],
      :seasonality9to11 => row[14],
      :icd10_1 => row[15],
      :icd10_2 => row[16],
      :description => row[17])
end
