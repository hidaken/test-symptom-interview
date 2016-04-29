require "csv"

CSV.foreach('db/fixtures/data/disease_symptom.csv') do |row|
  DiseaseSymptom.create(
      :disease_id => row[0], 
      :symptom_id => row[1], 
      :relation_point => row[2], 
      :plr => row[3], 
      :nlr => row[4], 
      :description => row[5] )
end