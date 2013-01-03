require './built_in_classes'
require './application'

describe Foo do
  describe "#speak" do
    it "is the class's name" do
      Foo.new.speak.should == "Foo"
    end
  end
end

describe Bar do
  describe "#speak" do
    it "is the class's name" do
      Bar.new.speak.should == "Bar"
    end
  end
end

require './enforcer'
