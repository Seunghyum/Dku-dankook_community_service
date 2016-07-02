class LectureInfo < ActiveRecord::Base
  has_many :lecture_estimates
  belongs_to :professor

  after_save :color_pick

  private
    def color_pick
      if self.l_type == "학부기초"
        self.update_column(:div_color, 'orange')
      elsif self.l_type == "전공필수"
        self.update_column(:div_color, 'red')
      elsif self.l_type == "전공선택"
        self.update_column(:div_color, 'blue')
      elsif self.l_type == "교양"
        self.update_column(:div_color, 'green')
      end
    end
end
