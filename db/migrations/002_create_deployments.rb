Sequel.migration do
  up do
    create_table(:deployments) do
      primary_key :id
      foreign_key :project_id
      String :label
      String :url
    end
  end

  down do
    drop_table(:deployments)
  end
end