class CreatesDeployment
  attr_accessor :params
  attr_writer :model
  def initialize(params={})
    @params = params
  end

  def model
    @model ||= Deployment
  end

  def create
    model.create(build_params)
  end

  def build_params
    @build_params ||= build_attributes.inject(params) do |params, attribute| 
      params[attribute] = send(attribute)
      params
    end
  end
end