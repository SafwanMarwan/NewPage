module V1
  module Defaults
    extend ActiveSupport::Concern

    included do
      version 'v1', using: :path
      format :json

      # global exception handler, used for error notifications
      rescue_from :all do |e|
        if Rails.env.development?
          error_response(message: e.message, status: 500)
        else
          error_response(message: "Internal server error", status: 500)
        end
      end

      helpers do
        # def current_user
        #   @current_user ||= User.find(params[:access_token])
        # end

        # def authenticate!
        #   error!('401 Unauthorized', 401) unless current_user
        # end

        # def check_status(allFollower, user_id)
        #   notfollow = Array.new
        #   follow = Array.new

        #   allFollower.each do |data|
        #     status = Relationship.where('follower_id' => user_id, 'followed_id' => data.id)
        #     if status.nil?
        #       notfollow.push(data)
        #     elsif
        #       follow.push(data)
        #     end
        #   end

        #   separateFollower = Array.new

        #   separateFollower.push(notfollow)
        #   separateFollower.push(follow)

        #   return separateFollower
        # end

        # def calculate_total_distance(loglist)
        #   total = 0
        #   loglist.each do |data|
        #     total += data.distance_travelled
        #   end
        #   return total
        # end

      end
    end
  end
end