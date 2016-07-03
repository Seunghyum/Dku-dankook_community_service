class LectureEstimate < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture_info

  acts_as_votable
  
  # 강의 평가 점수 합계 평균
  after_save :score_average, :total_average


  private
    def score_average
      avg = (self.fun + self.teaching + self.get_grade + self.teamwork_n_asg) / 4
      self.update_columns(average: avg)
    end

    def total_average
      esti = self.lecture_info.lecture_estimates
      av_fun = esti.average(:fun)
      av_teaching = esti.average(:teaching)
      av_get_grade = esti.average(:get_grade)
      av_teamwork_n_asg = esti.average(:teamwork_n_asg)

      av_average = (av_fun + av_teaching + av_get_grade + av_teamwork_n_asg) / 4

      self.lecture_info.update_columns(av_fun: av_fun, av_teaching: av_teaching, av_get_grade: av_get_grade, av_teamwork_n_asg: av_teamwork_n_asg, average: av_average)
    end
end
