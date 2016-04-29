require "csv"

CSV.foreach('db/fixtures/data/frequency_point.csv') do |row|
  FrequencyPoint.create(
      :disease_id => row[0], 
      :point => row[1],
      :department_id => row[2])
end