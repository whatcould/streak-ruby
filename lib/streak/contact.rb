module Streak
  class Contact < StreakObject
    def self.get(params = {})
      res = Streak.request(:get, "/search?query=#{params[:email]}")
      convert_to_streak_object(res, Contact)
    end
  end
end
