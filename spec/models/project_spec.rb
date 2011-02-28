require 'spec_helper'

describe Project do
  describe "#to_param" do
    it "displays the projects title" do
      project = Project.create :title => "I am a project"
      project.to_param.should == "#{project.id}-i-am-a-project"
    end
  end
  
  describe "#priority=" do
    context "when creating a new project" do
      it "defaults the priority to the first item in the list" do
        project = Project.new
        project.priority.should == 1
      end

      it "increments all projects with a priority greater than or equal to the new project's priority" do
        existing_project = Project.create :title => "First project"

        new_project = Project.create :title => "Second project"

        new_project.reload.priority.should == 1
        existing_project.reload.priority.should == 2
      end
    end

    context "when editing a project" do
      
      before do
        @project_one = Project.create :title => "First project", :priority => 1
        @project_two = Project.create :title => "Second project", :priority => 2
        @project_three = Project.create :title => "Third project", :priority => 3
        @project_four = Project.create :title => "Fourth project", :priority => 4
        @project_five = Project.create :title => "Fifth project", :priority => 5
      end
      
      context "and moving a priority to lower number" do
        it "increments all projects greater than or equal to the new priority and less than the old priority" do
          @project_four.priority = 2
          @project_four.save

          @project_one.reload.priority.should == 1
          @project_four.reload.priority.should == 2
          @project_two.reload.priority.should == 3
          @project_three.reload.priority.should == 4
          @project_five.reload.priority.should == 5
        end
      end

      context "and moving a priority to higher number" do
        it "decrements all projects less than or equal to the new priority and greater than the old priority" do
          @project_two.priority = 4
          @project_two.save

          @project_one.reload.priority.should == 1
          @project_three.reload.priority.should == 2
          @project_four.reload.priority.should == 3
          @project_two.reload.priority.should == 4
          @project_five.reload.priority.should == 5
        end
      end
    end

    context "when destroying a project" do
      it "decrements every project with a greater priority" do
        project_one = Project.create :title => "First project", :priority => 1
        project_two = Project.create :title => "Second project", :priority => 2
        project_three = Project.create :title => "Third project", :priority => 3
        project_four = Project.create :title => "Fourth project", :priority => 4

        project_two.destroy

        project_one.reload.priority.should == 1
        project_three.reload.priority.should == 2
        project_four.reload.priority.should == 3
      end
    end
  end
end