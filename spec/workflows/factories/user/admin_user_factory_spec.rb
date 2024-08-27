# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Factories::User::AdminUserFactory do
  describe 'create admin user' do
    context 'when user author invited' do
      it 'creates an author' do
        factory = described_class.new
        factory.create_author_admin_user
        expect(true).to be_truthy
      end

      it 'creates an owner' do
        factory = described_class.new
        factory.create_owner_admin_user
        expect(true).to be_truthy
      end
    end
  end
end
