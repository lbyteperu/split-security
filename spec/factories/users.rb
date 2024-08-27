# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    uid { email }
    password { '12345678' }
    password_confirmation { password }

    factory :confirmed_user do
      confirmed_at { Time.zone.now }
    end

    factory :user_without_uid do
      uid { '' }
    end

    factory :user_with_email_only do
      name { nil }
      uid { email }
      password { nil }
      password_confirmation { nil }
    end

    factory :user_with_empty_password do
      name { nil }
      uid { email }
      password { '' }
      password_confirmation { '' }
    end

    factory :user_with_short_password do
      name { nil }
      uid { email }
      password { '123' }
      password_confirmation { '123' }
    end

    factory :user_with_long_password do
      name { nil }
      uid { email }
      password { '1' * 129 }
      password_confirmation { '1' * 129 }
    end

    factory :user_password_without_number do
      name { nil }
      uid { email }
      password { 'testSTRONG$' }
      password_confirmation { 'testSTRONG$' }
    end

    factory :user_password_without_lowercase_letter do
      name { nil }
      uid { email }
      password { '123STRONG$' }
      password_confirmation { '123STRONG$' }
    end

    factory :user_with_nil_name do
      name { nil }
      uid { email }
      password { '12345678aA.' }
      password_confirmation { password }
    end

    factory :user_with_empty_email_address do
      email { '@emai.com' }
      name { nil }
      uid { email }
      password { '12345678' }
      password_confirmation { password }
    end

    factory :user_with_invalid_domain_email do
      email { 'test@' }
      name { nil }
      uid { email }
      password { '12345678' }
      password_confirmation { password }
    end

    factory :valid_user do
      name { 'pedro' }
      uid { email }
      password { '12345678aA.' }
      password_confirmation { password }
    end

    factory :valid_user_two do
      name { 'ramon' }
      uid { email }
      password { '12345678aA.' }
      password_confirmation { password }
    end
  end
end
# rubocop: enable Metrics/BlockLength
