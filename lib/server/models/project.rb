class Project < Sequel::Model
  one_to_many :deployments
end