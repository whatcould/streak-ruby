module Streak
  class Contact < StreakObject
    def self.get(params = {})
      res =
        if params[:email]
          Streak.request(:get, "/search?query=#{params[:email]}")
        elsif params[:key]
          Streak.request(:get, "/contacts/#{params[:key]}")
        else
          nil
        end
      convert_to_streak_object(res, Contact) if res
    end
  end
end
