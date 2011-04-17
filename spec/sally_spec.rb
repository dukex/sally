require 'spec_helper'

describe Sally do
  before(:each) do
    File.stub!(:open) {"My target 'evinicius.com'\nI want the links of '#posts' list\nExport to 'XML'"}
  end

  describe "on initialize" do
    let(:sally) { Sally.new "evinicius.sally" }

    it "should open file" do
      File.should_receive(:open).with("evinicius.sally")
      Sally.new "evinicius.sally"
    end

    it "should has target" do
      sally.target.should eql("evinicius.com")
    end

    it "should has resource" do
      sally.resource.should eql("#posts a")
    end
  end
end
