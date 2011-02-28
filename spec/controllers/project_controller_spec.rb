require 'spec_helper'

describe ProjectsController do

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
        post "create", :project => {:title => "Dane Cook"}
      end.should change(Project, :count).by(1)

      assigns(:project).should_not be_nil
      assigns(:project).should be_valid

      response.should redirect_to(projects_path)
    end
  end

  context "changing project records" do
    before do
      @project = Project.create :title => "Bob Saggot"
      @project.should be_valid
      @project.should_not be_new_record
      @project.id.should_not be_nil
    end

    describe "#edit" do
      it "should be successful" do
        post "edit", :id => @project.id
        response.should be_success
      end
    end

    describe "#update" do
      new_title = "Sob Baggot"

      it "should be successful" do
        put "update", :id => @project.id, :project => {:title => new_title}
        response.should redirect_to(project_path(@project.reload))

        @project.reload.title.should == new_title
      end
    end
  end

  describe "#destroy" do
    it "should be successful" do
      project = Project.create :title => "Adobe"
      delete "destroy", :id => project.id
      response.should redirect_to(projects_path)
    end
  end
end