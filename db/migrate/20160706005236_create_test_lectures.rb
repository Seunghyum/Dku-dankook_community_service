class CreateTestLectures < ActiveRecord::Migration
  def change
    create_table :test_lectures do |t|
      #교과목 번호
      t.integer :lnum
      #분반
      t.integer :divide
      #수업 이름
      t.string :name
      #학점
      t.integer :score
      #교수이름
      t.string :teacher
      #수업 날짜
      t.string :ldate
      #제한인원
      t.string :limit_num
      #수강신청한 사람들 카운팅
      t.integer :counting, default: 0

      t.timestamps null: false
    end
  end
end
