require 'spec_helper'
require 'rack/test'

require AppRoot + "/lib/server/server"

describe "Stag::Server" do
  include Rack::Test::Methods

  let(:app) {Stag::Server}

  describe "GET :new" do
    let(:project) {mock("Project")}
    before(:each) do
      Project.stub(:new).and_return(project)
      get "/projects/new"
    end

    it "should be ok" do
      last_response.should be_ok
    end
  end

  describe "POST :create" do
    let(:project) {mock("Project")}
    before(:each) do
      Project.stub(:new).and_return(project)
    end

    context "successfully" do
      before(:each) do
        project.stub(:save).and_return(true)
        post "/projects", {:some => "params"}
      end

      it "redirects" do
        last_response.should be_redirect
      end
    end
  end
end