require "csv"

CSV.foreach('db/fixtures/data/classify_relation.csv') do |row|
  ClassifyRelation.create(
      :disease_id => row[0], 
      :disease_classify_id => row[1])
end