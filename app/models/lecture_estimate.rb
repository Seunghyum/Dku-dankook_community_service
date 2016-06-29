class LectureEstimate < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture_info

  # 강의 평가 점수 합계 평균
  after_save :score_average

  private
    def score_average
      avg = (self.fun + self.teaching + self.get_grade + self.teamwork_n_asg) / 4
      self.update_columns(average: avg)
    end
end
