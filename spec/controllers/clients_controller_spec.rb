require 'spec_helper'

describe ClientsController do

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
        post "create", :client => {:name => "Daddy Warbucks"}
      end.should change(Client, :count).by(1)

      assigns(:client).should_not be_nil
      assigns(:client).should be_valid

      response.should redirect_to(clients_path)
    end
  end

  context "changing client records" do
    before do
      @client = Client.create :name => "Mamma' Sugar"
      @client.should be_valid
      @client.should_not be_new_record
      @client.id.should_not be_nil
    end

    describe "#edit" do
      it "should be successful" do
        post "edit", :id => @client.id
        response.should be_success
      end
    end

    describe "#update" do
      new_name = "Mamma' Cass"

      it "should be successful" do
        put "update", :id => @client.id, :client => {:name => new_name}
        response.should redirect_to(clients_path)

        @client.reload.name.should == new_name
      end
    end
  end

  describe "#destroy" do
    it "should be successful" do
      client = Client.create :name => "I hated that job"
      delete "destroy", :id => client.id
      response.should redirect_to(clients_path)
    end
  end
end