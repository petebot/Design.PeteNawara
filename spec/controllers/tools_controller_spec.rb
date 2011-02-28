require 'spec_helper'

describe ToolsController do

  describe "#index" do
    it "should be successful" do
      get "index"
      response.should be_success
    end
  end

  describe "#new" do
    it "should be successful" do
      get "new"
      response.should be_success
    end
  end

  describe "#create" do
    it "should be successful" do
      lambda do
        post "create", :tool => {:name => "Dane Cook"}
      end.should change(Tool, :count).by(1)

      assigns(:tool).should_not be_nil
      assigns(:tool).should be_valid

      response.should redirect_to(tools_path)
    end
  end

  context "changing tool records" do
    before do
      @tool = Tool.create :name => "Bob Saggot"
      @tool.should be_valid
      @tool.should_not be_new_record
      @tool.id.should_not be_nil
    end

    describe "#edit" do
      it "should be successful" do
        post "edit", :id => @tool.id
        response.should be_success
      end
    end

    describe "#update" do
      new_name = "Sob Baggot"

      it "should be successful" do
        put "update", :id => @tool.id, :tool => {:name => new_name}
        response.should redirect_to(tools_path)

        @tool.reload.name.should == new_name
      end
    end
  end

  describe "#destroy" do
    it "should be successful" do
      tool = Tool.create :name => "Adobe"
      delete "destroy", :id => tool.id
      response.should redirect_to(tools_path)
    end
  end
end