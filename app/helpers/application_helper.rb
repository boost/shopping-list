module ApplicationHelper
  def intersperse(array, separator)
    separator_array = Array.new(array.length - 1, separator)
    array.zip(separator_array).flatten.compact
  end
end
