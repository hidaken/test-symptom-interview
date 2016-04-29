#
table_names = %w[onsets categorise_symptom_relations categorise_disease_relations categorises classify_relations disease_classifies disease_symptoms diseases frequency_points large_categorises symptoms symptom_categories ]
table_names.each do |table_name|
    path = Rails.root.join("db/fixtures", Rails.env, table_name + ".rb")
    if File.exist?(path)
        puts "Creating #{table_name}"
        require path
    end
end

