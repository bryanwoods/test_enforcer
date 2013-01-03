class Enforcer
  class NoRSpecExampleFoundError < StandardError; end

  def self.establish_built_in_classes
    @built_in_classes ||= ObjectSpace.each_object.select do |object|
      object.is_a?(Class)
    end
  end

  def self.discover_application_classes
    @application_classes = ObjectSpace.each_object.select do |object|
      object.is_a?(Class)
    end.reject { |object| @built_in_classes.include?(object) }
  end

  def self.run
    @application_classes.each do |klass|
      unless RSpec.world.example_groups.map(&:described_class).include?(klass)
        raise NoRSpecExampleFoundError.new(
          "No spec for `#{klass}` found. Please write a test before proceeding."
        )
      end
    end
  end
end

Enforcer.establish_built_in_classes
