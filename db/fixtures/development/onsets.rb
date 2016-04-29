require "csv"

CSV.foreach('db/fixtures/data/onset.csv') do |row|
  Onset.create(:id => row[0], :onset_detail => row[1], :onset_name => row[2] )
end