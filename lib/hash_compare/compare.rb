# frozen_string_literal: true

# Best diff two objects.
module HashCompare
  def compare(comp_a, comp_b)
    return [] if comp_a.nil? && comp_b.nil?

    lack_key = (comp_a.keys - comp_b.keys).map { |key| ['-', key.to_s, comp_a.fetch(key)] }
    surplus_key = (comp_b.keys - comp_a.keys).map { |key| ['+', key.to_s, comp_b.fetch(key)] }

    lack_key + surplus_key
  end

  module_function :compare
end
