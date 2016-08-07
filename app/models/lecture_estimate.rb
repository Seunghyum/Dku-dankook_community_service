class LectureEstimate < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture_info

  acts_as_votable

  default_scope {order('cached_votes_score DESC')}

  # 강의 평가 점수 합계 평균
  after_update :lecture_best_ranking, if: :is_liberal

  after_update do
    if is_liberal && cached_votes_score_changed?
      lecture_best_ranking
    end
  end
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

    def is_liberal
      #develop 환경이라서 뒤의 로직이 필요하다. 교양과목만 순위가 의미가 있다.. 그래서 교양과목만 진행
      self.lecture_info.l_type == "교양" && LectureInfo.where(l_type: "교양").length > 10
    end

    def lecture_best_ranking
      best_category = BestFive.find_by(category: "교양")
      #default ordering이 좋아요 순이라 변경할 필요 없음
      best_10 = LectureInfo.where(l_type: "교양").take(10)
      if best_category.lecture_infos.present?
        best_category.lecture_infos.each do |info|
          info.update_column(:best_five_id, nil)
        end
      end
      best_10.each do |best|
        best.update_column(:best_five_id, best_category.id)
      end
    end
end
