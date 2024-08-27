# frozen_string_literal: true

module Factories
  module User
    class AdminUserFactory < Abstracts::User
      def create_author_admin_user
        Classes::AuthorAdminUser.new
      end

      def create_owner_admin_user
        Classes::OwnerAdminUser.new
      end
    end
  end
end
