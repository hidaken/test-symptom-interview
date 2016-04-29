require "csv"

CSV.foreach('db/fixtures/data/categorise_disease_relation.csv') do |row|
  CategoriseDiseaseRelation.create(
      :disease_id => row[0], 
      :categorise_id => row[1])
end