# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkGroup do
  subject(:profile) { build(:work_group) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:users).dependent(:destroy) }
  end
end
