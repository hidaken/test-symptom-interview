require "csv"

CSV.foreach('db/fixtures/data/disease_classify.csv') do |row|
  DiseaseClassify.create(
      :id => row[0], 
      :classify_name => row[1])
end