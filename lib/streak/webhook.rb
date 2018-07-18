module Streak
  class Webhook < StreakObject
    def self.all(pipeline_key=nil, params={})
      path = pipeline_key ? "/pipelines/#{pipeline_key}/webhooks" : "/webhooks"
      res = Streak.request_v2(:get, path, params)
      convert_to_streak_object(res, Webhook)
    end

    def self.find(key)
      res = Streak.request_v2(:get, "/webhooks/#{key}")
      convert_to_streak_object(res, Webhook)
    end

    def self.create(pipeline_key, params={})
      res = Streak.request_v2(:put, "/webhooks", params.merge({pipelineKey: pipeline_key}))
      convert_to_streak_object(res, Webhook)
    end

    def self.update(key, params)
      res = Streak.request_v2(:post, "/webhooks/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Webhook)
    end
  end
end