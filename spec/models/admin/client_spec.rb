require 'spec_helper'

describe Admin::Client do
  describe "#to_param" do
    it "displays the clients name" do
      client = Admin::Client.create :name => "I am a client"
      client.to_param.should == "#{client.id}-i-am-a-client"
    end
  end
end