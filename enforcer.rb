class Enforcer
  class NoRSpecExampleFoundError < StandardError; end

  def self.establish_built_in_classes
    @built_in_classes ||= all_classes
  end

  def self.discover_application_classes
    @application_classes = all_classes.reject do |klass|
      @built_in_classes.include?(klass)
    end
  end

  def self.run
    @application_classes.each do |klass|
      unless described_classes.include?(klass)
        raise NoRSpecExampleFoundError.new(
          "No spec for `#{klass}` found. Please write a test before proceeding."
        )
      end
    end
  end

  private

  def self.described_classes
    RSpec.world.example_groups.map(&:described_class)
  end

  def self.all_classes
    ObjectSpace.each_object(Class).to_a
  end
end

Enforcer.establish_built_in_classes
