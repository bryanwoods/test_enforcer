$built_in_classes = ObjectSpace.each_object.select do |object|
  object.is_a?(Class)
end
