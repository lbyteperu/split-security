# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfile do
  subject(:basic_user_profile) { build(:user_profile) }

  let(:it_admin) { build(:user_profile) }

  describe 'given a root profile' do
    context 'when user is valid' do
      it 'accesses profile title from user' do
        basic_user_profile.valid?
        basic_user_profile.save!
        expect(User.last.profiles.first.title).to eq 'default'
      end

      it 'accesses user nane from profile' do
        basic_user_profile.valid?
        basic_user_profile.save!
        expect(Profile.last.users.first.name).to eq 'pedro'
      end
    end
  end
end
