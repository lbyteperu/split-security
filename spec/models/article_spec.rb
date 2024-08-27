# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  subject(:article) { build(:article) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to validate_length_of(:title).is_at_least(3) }

    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
  end

  # describe 'concerns' do
  #  it '.sorted' do
  #    expect(described_class.order('body desc').to_sql).to eq described_class.sorted('body', 'desc').to_sql
  #    expect(described_class.order('title asc').to_sql).to eq described_class.sorted('x', 'x').to_sql
  #  end
  # end
end
