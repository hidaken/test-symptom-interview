require "csv"

CSV.foreach('db/fixtures/data/categorise_symptom_relation.csv') do |row|
  CategoriseSymptomRelation.create(
      :categorise_id => row[0], 
      :symptom_id => row[1])
end