# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu do
  subject(:menu) { build(:menu) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(3) }
    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }

    it { is_expected.to validate_presence_of(:link_to) }
    it { is_expected.to validate_length_of(:link_to).is_at_least(3) }
  end

  describe 'associations' do
    it { is_expected.to belongs_to(:users).dependent(:destroy) }
  end
end
