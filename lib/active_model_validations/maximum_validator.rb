require 'active_model/validator'

class MaximumValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << error_message if value.present? && value > maximum_value(record)
  end

  private

  def maximum_value(record)
    if options[:value].is_a?(Proc)
      options[:value].call(record)
    elsif options[:value].is_a?(Symbol)
      record.send(options[:value])
    else
      options[:value]
    end
  end

  def error_message
    if options[:message].is_a?(Proc)
      options[:message].call
    else
      options[:message]
    end
  end
end
