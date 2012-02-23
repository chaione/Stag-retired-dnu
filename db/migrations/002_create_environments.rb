Sequel.migration do
  up do
    create_table(:environments) do
      primary_key :id
      foreign_key :project_id
      String :label
    end
  end

  down do
    drop_table(:environments)
  end
end