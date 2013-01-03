class NoRSpecExampleFoundError < StandardError; end

$application_classes.each do |klass|
  unless RSpec.world.example_groups.map(&:described_class).include?(klass)
    raise NoRSpecExampleFoundError.new(
      "No spec for `#{klass}` found. Please write a test before proceeding."
    )
  end
end
