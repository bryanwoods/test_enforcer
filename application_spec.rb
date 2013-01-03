require './enforcer'
require './application'

RSpec.configure do |config|
  Enforcer.discover_application_classes

  config.after do
    Enforcer.run
  end
end

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
