require "csv"

CSV.foreach('db/fixtures/data/categorise.csv') do |row|
  Categorise.create(
      :id => row[0], 
      :categorise_name => row[1])
end