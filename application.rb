class Foo
  def speak
    "Foo"
  end
end

class Bar
  def speak
    "Bar"
  end
end

class Baz
  def speak
    "Baz"
  end
end

$application_classes = ObjectSpace.each_object.select do |object|
  object.is_a?(Class)
end.reject { |object| $built_in_classes.include?(object) }
