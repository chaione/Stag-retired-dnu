# For console use
ENV["RACK_ENV"] ||= "development"


require File.expand_path(File.join(File.expand_path(__FILE__), "..", "..", "stag"))
require 'sinatra'

class Stag::Server < Sinatra::Base

  get "/" do
    redirect to "/projects"
  end

  # Projects

  get "/projects/new" do
    @project = Project.new
    haml :"projects/new"
  end

  post "/projects" do
    @project = Project.new(params[:project])
    if @project.save
      redirect to "/projects"
    else
      haml :"projects/new"
    end
  end

  get "/projects" do
    @projects = Project.all
    haml :"projects/index"
  end

  # deployments

  get "/projects/:project_id/deployments/new" do
    @project = Project.find :id => params[:project_id]
    @deployment = Deployment.new
    haml :"deployments/new"
  end

  post "/projects/:project_id/deployments" do
    @project = Project.find :id => params[:project_id]
    @deployment = CreatesDeployment.create(@project, params[:deployment])
    redirect to "/projects"
  end

  # Stylesheets

  get "/stylesheets/styles.css" do
    scss :"stylesheets/styles", :style => :expanded
  end

  get "/javascripts/app.js" do
    coffee :"javascripts/app"
  end

end
