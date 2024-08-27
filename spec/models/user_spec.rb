# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    # it { is_expected.to have_many(:work_groups).dependent(:destroy) }
    it { is_expected.to have_many(:profiles) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe 'callbacks' do
    context 'with before_validation' do
      it 'setses uid as email' do
        user = described_class.new attributes_for :user_without_uid
        user.valid?
        expect(user.uid).to eq(user.email)
      end

      it 'does not set uid as email' do
        user = described_class.new attributes_for :user_without_uid
        expect(user.uid).to be_empty
      end
    end
  end

  describe 'new user is created' do
    context 'when user email is invalid' do
      let(:user_with_empty_email_address) { build(:user_with_empty_email_address) }
      let(:user_with_invalid_domain_email) { build(:user_with_invalid_domain_email) }

      it 'is empty email address' do
        user_with_empty_email_address.save
        user_with_empty_email_address.valid?
        expect(user_with_empty_email_address.errors[:email]).to eq ['is not an email', 'is invalid']
      end

      it 'is not a domain' do
        user_with_invalid_domain_email.save
        user_with_invalid_domain_email.valid?
        expect(user_with_invalid_domain_email.errors[:email]).to eq ['is not an email', 'is invalid']
      end
    end

    context 'when user email is valid' do
      let(:user_with_email) { build(:user_with_email_only) }

      it 'is a valid email' do
        user_with_email.save
        user_with_email.valid?
        expect(user_with_email.errors[:email]).to eq []
      end
    end

    context 'when user password is invalid' do
      let(:user_with_empty_password) { build(:user_with_empty_password) }
      let(:user_with_short_password) { build(:user_with_short_password) }
      let(:user_with_long_password) { build(:user_with_long_password) }

      it 'is blank password' do
        user_with_empty_password.save
        user_with_empty_password.valid?
        expect(user_with_empty_password.errors[:password][0]).to eq "can't be blank"
      end

      it 'is too short password' do
        user_with_short_password.save
        user_with_short_password.valid?
        p user_with_short_password.errors[:password]
        expect(user_with_short_password.errors[:password][0]).to eq 'is too short (minimum is 8 characters)'
      end

      it 'is too long password' do
        user_with_long_password.save
        user_with_long_password.valid?
        expect(user_with_long_password.errors[:password][0]).to eq 'is too long (maximum is 128 characters)'
      end
    end

    context 'when user password is weak' do
      let(:user_password_without_number) { build(:user_password_without_number) }
      let(:user_password_without_lowercase_letter) { build(:user_password_without_lowercase_letter) }

      it 'number not preset' do
        user_password_without_number.save
        user_password_without_number.valid?
        expect(user_password_without_number
          .errors[:password][0])
          .to eq 'should contain a number, lowercase and uppercase letter, symbol'
      end

      it 'lowercase not present' do
        user_password_without_lowercase_letter.save
        user_password_without_lowercase_letter.valid?
        expect(user_password_without_lowercase_letter
        .errors[:password][0])
          .to eq 'should contain a number, lowercase and uppercase letter, symbol'
      end
    end

    context 'when user is valid' do
      let(:user_with_nil_name) { build(:user_with_nil_name) }

      it 'is nil name' do
        user_with_nil_name.save
        user_with_nil_name.valid?
        expect(user_with_nil_name).to be_valid
      end
    end
  end
end
