require "csv"

CSV.foreach('db/fixtures/data/large_categorise.csv') do |row|
  LargeCategorise.create(
      :large_categorise_id => row[0], 
      :large_categorise_name => row[1], 
      :categorise_id => row[2])
end