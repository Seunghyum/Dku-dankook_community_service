module LectureInfosHelper
  def best_reply(reply)
    reply.lecture_estimates.max {|a,b| a.cached_votes_score <=> b.cached_votes_score }
  end
end
