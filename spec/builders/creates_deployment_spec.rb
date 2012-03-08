# require 'spec_helper'
require File.expand_path(File.join(File.expand_path(__FILE__), "..", "..", "..")) + "/lib/server/models/builders/deployment_builder"

class Deployment; end

describe CreatesDeployment do
  let(:params) {
    {
      :url => "www.wicked-app.com",
      :label => "production"
    }
  }

  describe "building a model" do

    before(:each) {
      subject.stub(:build_params).and_return(params)
    }

    it "should create a model with params" do
      subject.model.should_receive(:create).with(params)
      subject.create
    end
  end

  describe "assembling finished_params" do
    subject { CreatesDeployment.new params }
    before(:each) {
      subject.stub(:build_attributes).and_return([:color, :size])
      subject.stub(:color).and_return("orange")
      subject.stub(:size).and_return("large")
    }

    its(:build_params) {
      should eql({
          :url => "www.wicked-app.com",
          :label => "production",
          :color => "orange",
          :size => "large"
        })
  
    }
  end
end