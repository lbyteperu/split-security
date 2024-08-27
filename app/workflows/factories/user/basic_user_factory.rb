# frozen_string_literal: true

module Factories
  module User
    class BasicUserFactory < Abstracts::User
      def create_invite_basic_user
        Classes::InvitedBasicUser.new
      end

      def create_visitor_admin_user
        Classes::VisitorBasicUser.new
      end
    end
  end
end
