require "csv"

CSV.foreach('db/fixtures/data/symptom.csv') do |row|
  Symptom.create(:id => row[0], :symptom_category_id => row[1], :symptom_name => row[2], :symptom_flag => row[3], :symptom_text => row[4], :symptom_description => row[5] )
end