# frozen_string_literal: true

module Factories
  module User
    class AuthorUserFactory < Abstracts::User
      def build
        Classes::AuthorUser.new
        #  author_user.profile = Profile.find(1)
        # author_user.permissions = Permissions.find(1)
      end
    end
  end
end
