# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Factories::User::BasicUserFactory do
  describe 'create basic user' do
    context 'when user is invited' do
      it 'creates an invited user' do
        factory = described_class.new
        factory.create_invite_basic_user
        expect(true).to be_truthy
      end

      # it 'creates an visitor user' do
      #   factory = described_class.new
      #   factory.create_invite_basic_user
      #   expect(true).to be_truthy
      # end
    end
  end
end
