require 'spec_helper'

class MinimumValidatorModel < OpenStruct
  include ActiveModel::Validations

  validates :value, minimum: { value: 0, message: 'must not be lower than the minimum value' }
end

RSpec.describe MinimumValidator do
  it 'allows an equal value' do
    model = MinimumValidatorModel.new(value: 0)

    expect(model).to be_valid
    expect(model.errors).to be_empty
  end

  it 'allows a higher value' do
    model = MinimumValidatorModel.new(value: 1)

    expect(model).to be_valid
    expect(model.errors).to be_empty
  end

  it 'fails a lower value' do
    model = MinimumValidatorModel.new(value: -1)

    expect(model).not_to be_valid
    expect(model.errors[:value]).to include 'must not be lower than the minimum value'
  end
end
