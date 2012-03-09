class CreatesDeployment
  attr_accessor :params
  attr_writer :model
  def initialize(project, params={})
    @project = project
    @params = params
  end

  def self.create(*args)
    new(*args).create
  end

  def model
    @model ||= Deployment
  end

  def create
    model.create(build_params)
  end

  def project_id
    @project.id
  end

  def build_attributes
    [:project_id]
  end

  def build_params
    @build_params ||= build_attributes.inject(params) do |params, attribute| 
      params[attribute] = send(attribute)
      params
    end
  end
end
