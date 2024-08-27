# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    transient { user { create(:valid_user) } }
    transient { profile { create(:profile) } }

    user_id { user.id }
    profile_id { profile.id }

    # factory :user_with_root_profile do
    #  transient { profile { create(:is_root_profile) } }
    # end
  end

  factory :root_profile_with_many_users do
    transient { profile { create(:root_profile_without_parent_id) } }

    transient { user1 { create(:valid_user) } }
    transient { user2 { create(:valid_user_two) } }
  end
end
