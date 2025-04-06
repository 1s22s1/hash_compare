# frozen_string_literal: true

# Best diff two hashes.
module HashCompare
  module_function

  def compare(comp_a, comp_b)
    return compare_nil(comp_a, comp_b) if comp_a.nil? || comp_b.nil?

    lack_keys = lack_keys(comp_a, comp_b)
    surplus_keys = surplus_keys(comp_a, comp_b)

    diff_keys = lack_keys + surplus_keys
    if diff_keys.empty?
      compare_value(comp_a, comp_b)
    else
      diff_keys
    end
  end

  def lack_keys(comp_a, comp_b)
    (comp_a.keys - comp_b.keys).map { |key| ['-', key.to_s, comp_a.fetch(key)] }
  end

  def surplus_keys(comp_a, comp_b)
    (comp_b.keys - comp_a.keys).map { |key| ['+', key.to_s, comp_b.fetch(key)] }
  end

  def compare_nil(comp_a, comp_b)
    return [] if comp_a.nil? && comp_b.nil?

    [['~', '', comp_a, comp_b]] if comp_a.nil? || comp_b.nil?
  end

  def compare_value(comp_a, comp_b)
    comp_a
      .keys
      .reject { |key| comp_a.fetch(key) == comp_b.fetch(key) }
      .map { |key| ['~', key.to_s, comp_a.fetch(key), comp_b.fetch(key)] }
  end

  private_class_method %i[lack_keys surplus_keys compare_nil compare_value]
end
