require 'spec_helper'

class MaximumValidatorModel < OpenStruct
  include ActiveModel::Validations

  validates :value, maximum: { value: 0, message: 'must not be higher than the maximum value' }
end

RSpec.describe MaximumValidator do
  it 'allows an equal value' do
    model = MaximumValidatorModel.new(value: 0)

    expect(model).to be_valid
    expect(model.errors).to be_empty
  end

  it 'allows a lower value' do
    model = MaximumValidatorModel.new(value: -1)

    expect(model).to be_valid
    expect(model.errors).to be_empty
  end

  it 'fails a higher value' do
    model = MaximumValidatorModel.new(value: 1)

    expect(model).not_to be_valid
    expect(model.errors[:value]).to include 'must not be higher than the maximum value'
  end
end
