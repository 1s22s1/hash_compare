# frozen_string_literal: true

# Best diff two objects.
module HashCompare
  def compare(comp_a, comp_b)
    target_keys = comp_a.keys - comp_b.keys

    target_keys.map { |key| ['-', key, comp_a.fetch(key)] }
  end

  module_function :compare
end
