# # 인액터스 데이터 가져오기
# require 'csv'
# require 'open-uri'
#
# Board.create(name: "자유게시판", description: "자유롭게 말하세요!")
#
# csv_text = File.read("#{Rails.root}/db/enactus_book.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   saving = Book.new(row.to_hash)
#   saving.save
# end
#
# BestFive.create(category: "교양")
# BestFive.create(category: "자유게시판")
#
User.create(username: "운영자1", name: "운영자", email: 'antmgu@gmail.com', password: "(ajttk2016)", password_confirmation: "(ajttk2016)", role: "슈퍼관리자", major_id: 1, certification: true)
User.create(username: "운영자2", name: "운영자2", email: 'antmgu@gmail.com', password: "(ajttk2016)", password_confirmation: "(ajttk2016)", role: "슈퍼관리자", major_id: 1, certification: true)
User.create(username: "운영자3", name: "운영자3", email: 'antmgu@gmail.com', password: "(ajttk2016)", password_confirmation: "(ajttk2016)", role: "슈퍼관리자", major_id: 1, certification: true)
User.create(username: "운영자4", name: "운영자4", email: 'antmgu@gmail.com', password: "(ajttk2016)", password_confirmation: "(ajttk2016)", role: "슈퍼관리자", major_id: 1, certification: true)
User.create(username: "Enactus", name: "Enactus", email: '1@1.com', password: "encatus123", password_confirmation: "encatus123", role: "인액터스", major_id: 1, certification: true)
# # Board.create(name: "자유게시판", description: "자유롭게 말하세요")
# # 1.upto(50) do |x|
# #     Post.create(title: "테스트 타이틀#{x}", content: "내용테스트#{x}", user_id: 1, board_id: 1, hits: x)
# # end
#
# #사물함 갯수 제한( 전체 사물함 갯수 - 이미 지정된 사물함 갯수 )
# Major.create(name: "국제경영" )
# Locker.create(limit_num: 100, major_id: 1)
#
# Major.create(name: "모바일" )
# Locker.create(limit_num: 100, major_id: 2)
# #
# # #노코기리 전화번호부 긁어오기
#
#  require 'nokogiri'
#
#  @domain_both = Array.new
#  @domain_both = [
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%B4%9D%EC%9E%A5%20%EC%A7%81%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EB%B3%B8%EB%B6%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EA%B5%90%EC%9C%A1%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%EC%B1%85%EC%A4%91%EC%A0%90%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EC%9B%90&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%82%B0%ED%95%99%ED%98%91%EB%A0%A5%EB%8B%A8%28%EC%A3%BD%EC%A0%84%29&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%B4%9D%EC%9E%A5+%EC%A7%81%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2"
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EB%B3%B8%EB%B6%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EA%B5%90%EC%9C%A1%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%EC%B1%85%EC%A4%91%EC%A0%90%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EC%9B%90&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#       "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2"
#       ]
# @domain_both.each do |x|
#   @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))
#     @row = @html.css("tr").length
#     1.upto(@row) do |a|
#       SchoolPhoneSearching.create(campus: @html.css("table//tr:nth-child(#{a})//td:nth-child(1)").inner_text, belong: @html.css("table//tr:nth-child(#{a})//td:nth-child(3)").inner_text, name: @html.css("table//tr:nth-child(#{a})//td:nth-child(4)").inner_text, phone: @html.css("table//tr:nth-child(#{a})//td:nth-child(5)").inner_text )
#     end
#  end
#
#
# #교수정보 가져오기
# @professor = Array.new
# @professor = [
#   # #문과대학
#    "http://www.dankook.ac.kr/web/kor/-152?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#    "http://www.dankook.ac.kr/web/kor/-153?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#    "http://www.dankook.ac.kr/web/kor/-154?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#    "http://www.dankook.ac.kr/web/kor/-155?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#    "http://www.dankook.ac.kr/web/kor/-156?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #법과대
#   "http://www.dankook.ac.kr/web/kor/-158?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #사회과학대학
#   "http://www.dankook.ac.kr/web/kor/-160?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-161?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-162?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-164?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-235?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-317?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-167?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-168?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #상경대
#   "http://www.dankook.ac.kr/web/kor/-171?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-172?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-173?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-174?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-318?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-175?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-52?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #자연대학(구학문)
#   "http://www.dankook.ac.kr/web/kor/-231?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-232?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-234?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-233?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #건축대학
#   "http://www.dankook.ac.kr/web/kor/-177?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-178?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #공과대학
#   "http://www.dankook.ac.kr/web/kor/-319?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-180?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-181?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-182?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-183?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-184?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-185?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-186?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-187?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-188?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-189?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #사범대
#   "http://www.dankook.ac.kr/web/kor/-191?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-192?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-193?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-194?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-195?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-196?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #예술대학
#   "http://www.dankook.ac.kr/web/kor/-197?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-198?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-199?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-200?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-201?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-320?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-202?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-203?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #음악대학
#   "http://www.dankook.ac.kr/web/kor/-205?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-207?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-208?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-209?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   #국제대학
#   "http://www.dankook.ac.kr/web/kor/-211?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   "http://www.dankook.ac.kr/web/kor/-212?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view",
#   # 교양대
#   "http://www.dankook.ac.kr/web/kor/-150?p_p_id=DeptInfo_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=1&_DeptInfo_WAR_empInfoportlet_viewNo=1&_DeptInfo_WAR_empInfoportlet_action=view"
# ]
#
# #주석 이해하기위해서는 위의 교수정보사이트의 HTML태그를 보면서 이해해야 함.
# @professor.each do |x|
#   @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))
#
#   #교수들의 정보가 있는 div 태그의 줄
#   @wraper_row = @html.css(".professor").length + @h4_row = @html.css(".portlet-body > div > h4").length
#
#   #줄만큼 반복
#   1.upto(@wraper_row) do |a|
#     #h4태그 일떄(= 교수정보가 없는 태그일 때)
#     if @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(1)").empty?
#
#     #한줄에 2개의 교수정보 div가있을때
#     elsif @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid").length == 2
#      1.upto(2) do |b|
#        doc = @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span8 > .name > span.more > a[href]").map { |link| link['href'] }
#        Professor.create(
#          name: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span8 > .name > a").search("a").remove.inner_text,
#          belong: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span8 > .name").inner_text,
#
#         #  intro: @html.at_xpath(".portlet-body//div//.professor.row-fluid:nth-child(#{a})//.span6.row-fluid:nth-child(#{b})//.span8//p.name//span.more//a[normalize-space(.)=img]")['href']
#          intro_url: doc.join(","),
#          profile: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span4.photo > .img_wrap > img").attr("src").inner_text.to_s
#        )
#      end
#
#     #한줄에 1개의 교수정보 div가 있을 때
#     else
#      doc = @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid > .span8 > .name > span.more > a[href]").map { |link| link['href'] }
#      Professor.create(
#        name: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid > .span8 > .name > a").search("a").remove.inner_text,
#        belong: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid > .span8 > .name").inner_text,
#
#       #  intro: @html.at_xpath(".portlet-body//div//.professor.row-fluid:nth-child(#{a})//.span6.row-fluid:nth-child(#{b})//.span8//p.name//span.more//a[normalize-space(.)=img]")['href']
#        intro_url: doc.join(","),
#        profile: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(1) > .span4.photo > .img_wrap > img").attr("src").inner_text.to_s
#      )
#     end
#   end
# end
#
# # LectureInfo.create(name: "1경영학", l_type: "전공필수", time: 10, semester: 2, professor_id: 1, all_view: 10)
# # LectureInfo.create(name: "2전공선태그스", l_type: "전공선택", time: 10, semester: 2, professor_id: 2, all_view: 9)
# # LectureInfo.create(name: "3학북기쵸", l_type: "학부기초", time: 10, semester: 2, professor_id: 3, all_view: 8)
# # LectureInfo.create(name: "4교양이", l_type: "교양", time: 10, semester: 2, professor_id: 4, all_view: 7)
# # LectureInfo.create(name: "5교양이2", l_type: "교양", time: 10, semester: 2, professor_id: 5, all_view: 6)
# # LectureInfo.create(name: "6경영학", l_type: "전공필수", time: 10, semester: 2, professor_id: 1, all_view: 7)
# # LectureInfo.create(name: "7전공선태그스", l_type: "전공선택", time: 10, semester: 2, professor_id: 2, all_view: 6)
# # LectureInfo.create(name: "8학북기쵸", l_type: "학부기초", time: 10, semester: 2, professor_id: 3, all_view: 5)
# # LectureInfo.create(name: "9교양이", l_type: "교양", time: 10, semester: 2, professor_id: 4, all_view: 4)
# # LectureInfo.create(name: "10교양이2", l_type: "교양", time: 10, semester: 2, professor_id: 5, all_view: 8)
# # LectureInfo.create(name: "11교양이", l_type: "교양", time: 10, semester: 2, professor_id: 4, all_view: 4)
# # LectureInfo.create(name: "12교양이2", l_type: "교양", time: 10, semester: 2, professor_id: 5, all_view: 30)
# # LectureInfo.create(name: "13교양이", l_type: "교양", time: 10, semester: 2, professor_id: 4, all_view: 3)
# # LectureInfo.create(name: "14교양이2", l_type: "교양", time: 10, semester: 2, professor_id: 5, all_view: 4)
# # LectureEstimate.create(fun: 20, teaching: 40, get_grade: 60, teamwork_n_asg: 80, user_id: 1, lecture_info_id: 1, reason: "학점", msg: "진심 비추합니다. 처음듣는 교양과목이라 재미있고 흥미로울거 같아서 신청했는데 정말 아무것도 배운거 없이 학기가 끝났네요. 제목은 성차와 성차별인데 성차와 성차별에 대해서 배운적이 없는거 같습니다. 그냥 그 주에 가장 이슈가 된 토픽으로 토론을 한시간 반정도하고 나머지는 별 쓰잘데기 없는소리하고 끝납니다. 시간도 세시간 꽉꽉 채워서 하시구요. 진짜 강의계획서 하나도 안 지키시고 뭘말하고싶은건지 뭘 가르치고자 하시는건지 모르겠습니다.. 진심 강의평가 처음남기는데 이거 듣지말라고 남깁니다. 성적 채점방식도 이상합니다 . 길게 쓰면 에이고 내용 다들어가도 짧으면 씨입니다 . 진심 듣지마세요 ...")
# # LectureEstimate.create(fun: 40, teaching: 60, get_grade: 80, teamwork_n_asg: 100, user_id: 2, lecture_info_id: 1, reason: "흥미", msg: "말이 필요없음.
# # 모든 과목을 문수원교수님께서 강의하셨으면 하는 마음이 들정도로 아주아주 꿀인 수업!
# # 강추!!")
# # LectureEstimate.create(fun: 40, teaching: 80, get_grade: 100, teamwork_n_asg: 60, user_id: 3, lecture_info_id: 6,  reason: "배움", msg: "시험형태가 너무 다채롭고 특히 논술형 문제 채점은 길게 안쓰면 안됩니다. 일명 씨디제조기이기 때문에 출석은 무조건 만점주시고 사람이 좋으시고 매너있어보인다고 공부 대강하시면 안됩니다. 저도 에이밖에는...")
# # LectureEstimate.create(fun: 80, teaching: 80, get_grade: 20, teamwork_n_asg: 40, user_id: 3, lecture_info_id: 6,  reason: "배움", msg: "이분 정말 과제도 딱 1개에다가 수업시간에 질문하시는거 답변잘하시고 시험볼때 답안 열심히만 쓰시면 에이플은 바로 주시고 심지여 반페이지만 쓴사람도 비플러스 받는다는 썰이... 정말 짱입니다!")
# # LectureEstimate.create(fun: 100, teaching: 40, get_grade: 60, teamwork_n_asg: 20, user_id: 3, lecture_info_id: 7,  reason: "배움", msg: "이 교수님 수업은 공부안해도 된다라는 소문이 도는데 그건 뻥이고 교과서 정독함으로써 논술에 필요한 배경지식 익혀두는 게 좋습니다. 자신의 의견을 펼치는 것을 중요시합니다.")
# # LectureEstimate.create(fun: 60, teaching: 40, get_grade: 80, teamwork_n_asg: 20, user_id: 3, lecture_info_id: 8,  reason: "배움", msg: "이분 점수도100점주실만큼 학점 잘주시고 문제도 너무 쉽고 그냥꿀이요 ㅎㅎ")
# #
# # LectureEstimate.create(fun: 40, teaching: 80, get_grade: 100, teamwork_n_asg: 60, user_id: 3, lecture_info_id: 8,  reason: "배움", msg: "시험형태가 너무 다채롭고 특히 논술형 문제 채점은 길게 안쓰면 안됩니다. 일명 씨디제조기이기 때문에 출석은 무조건 만점주시고 사람이 좋으시고 매너있어보인다고 공부 대강하시면 안됩니다. 저도 에이밖에는...")
# # LectureEstimate.create(fun: 80, teaching: 80, get_grade: 20, teamwork_n_asg: 40, user_id: 3, lecture_info_id: 8,  reason: "배움", msg: "이분 정말 과제도 딱 1개에다가 수업시간에 질문하시는거 답변잘하시고 시험볼때 답안 열심히만 쓰시면 에이플은 바로 주시고 심지여 반페이지만 쓴사람도 비플러스 받는다는 썰이... 정말 짱입니다!")
# # LectureEstimate.create(fun: 100, teaching: 40, get_grade: 60, teamwork_n_asg: 20, user_id: 3, lecture_info_id: 9,  reason: "배움", msg: "이 교수님 수업은 공부안해도 된다라는 소문이 도는데 그건 뻥이고 교과서 정독함으로써 논술에 필요한 배경지식 익혀두는 게 좋습니다. 자신의 의견을 펼치는 것을 중요시합니다.")
# # LectureEstimate.create(fun: 60, teaching: 40, get_grade: 80, teamwork_n_asg: 20, user_id: 3, lecture_info_id: 10,  reason: "배움", msg: "이분 점수도100점주실만큼 학점 잘주시고 문제도 너무 쉽고 그냥꿀이요 ㅎㅎ")
# #
# # LectureEstimate.create(fun: 40, teaching: 80, get_grade: 100, teamwork_n_asg: 60, user_id: 3, lecture_info_id: 11,  reason: "배움", msg: "시험형태가 너무 다채롭고 특히 논술형 문제 채점은 길게 안쓰면 안됩니다. 일명 씨디제조기이기 때문에 출석은 무조건 만점주시고 사람이 좋으시고 매너있어보인다고 공부 대강하시면 안됩니다. 저도 에이밖에는...")
# # LectureEstimate.create(fun: 80, teaching: 80, get_grade: 20, teamwork_n_asg: 40, user_id: 3, lecture_info_id: 12,  reason: "배움", msg: "이분 정말 과제도 딱 1개에다가 수업시간에 질문하시는거 답변잘하시고 시험볼때 답안 열심히만 쓰시면 에이플은 바로 주시고 심지여 반페이지만 쓴사람도 비플러스 받는다는 썰이... 정말 짱입니다!")
# # LectureEstimate.create(fun: 100, teaching: 40, get_grade: 60, teamwork_n_asg: 20, user_id: 3, lecture_info_id: 13,  reason: "배움", msg: "이 교수님 수업은 공부안해도 된다라는 소문이 도는데 그건 뻥이고 교과서 정독함으로써 논술에 필요한 배경지식 익혀두는 게 좋습니다. 자신의 의견을 펼치는 것을 중요시합니다.")
# # LectureEstimate.create(fun: 60, teaching: 40, get_grade: 80, teamwork_n_asg: 20, user_id: 3, lecture_info_id: 14,  reason: "배움", msg: "이분 점수도100점주실만큼 학점 잘주시고 문제도 너무 쉽고 그냥꿀이요 ㅎㅎ")
#
# RehearsalLecture.create(lnum: "301321", divide: "2", name: "멋쟁이 사자처럼", score: 3, teacher: "이두희", ldate: "월,수,금 10,11", limit_num: 100)
# RehearsalLecture.create(lnum: "56391", divide: "1", name: "인간과 사회", score: 3, teacher: "강동주", ldate: "월 4,5,8", limit_num: 45)
# RehearsalLecture.create(lnum: "910912", divide: "4", name: "강의명 짓기 넘나 어려운 것..", score: 3, teacher: "문승현", ldate: "목 15,16,17", limit_num: 200)
# RehearsalLecture.create(lnum: "123456", divide: "2", name: "알아, 이 개자식아", score: 3, teacher: "수지", ldate: "수,목 22,23", limit_num: 100)
# RehearsalLecture.create(lnum: "472811", divide: "1", name: "UFC 기초", score: 3, teacher: "고영일", ldate: "[사이버]", limit_num: 20)
# RehearsalLecture.create(lnum: "21193", divide: "3", name: "영웅은 죽지않아요 너만 빼고", score: 3, teacher: "김순후", ldate: "수 5,6,7", limit_num: 150)
# RehearsalLecture.create(lnum: "11220", divide: "1", name: "멋쟁이 사자처럼", score: 3, teacher: "유태하", ldate: "화,금 1,2,3", limit_num: 34)
