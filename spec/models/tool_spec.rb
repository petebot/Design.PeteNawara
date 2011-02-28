require 'spec_helper'

describe Tool do
  describe "#to_param" do
    it "displays the tools name" do
      tool = Tool.create :name => "I am a tool"
      tool.to_param.should == "#{tool.id}-i-am-a-tool"
    end
  end
end