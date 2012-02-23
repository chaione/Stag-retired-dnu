class Project < Sequel::Model
  one_to_many :environments
end