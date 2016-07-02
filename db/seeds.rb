# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "admin_moon", gender: "남자", email: 'qwe@qwe.com', password: "12341234", password_confirmation: "12341234", role: "슈퍼관리자")
User.create(username: "moon", gender: "남자", email: '123@123.com', password: "12341234", password_confirmation: "12341234", role: "학생")
User.create(username: "female", gender: "여자", email: '23@123.com', password: "12341234", password_confirmation: "12341234", role: "학생")

Board.create(name: "자유게시판", description: "자유롭게 말하세요")
85.times do
    Post.create(title: "테스트 타이틀", content: "내용테스트", user_id: 1, board_id: 1)
end

#사물함 갯수 제한( 전체 사물함 갯수 - 이미 지정된 사물함 갯수 )
Major.create(mname: "국제경영" )

Major.create(mname: "모바일" )

# #노코기리 전화번호부 긁어오기
# require 'nokogiri'
#
# @domain_jook = Array.new
# @domain_jook = [
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%B4%9D%EC%9E%A5%20%EC%A7%81%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EB%B3%B8%EB%B6%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EA%B5%90%EC%9C%A1%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%EC%B1%85%EC%A4%91%EC%A0%90%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EC%9B%90&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%82%B0%ED%95%99%ED%98%91%EB%A0%A5%EB%8B%A8%28%EC%A3%BD%EC%A0%84%29&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
#     "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1"
# ]
#
# @domain_jook.each do |x|
#     @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))
#     @row = @html.css("tr").length
#     1.upto(@row) do |a|
#         SchoolJook.create(belong: @html.css("table//tr:nth-child(#{a})//td:nth-child(3)").inner_text, name: @html.css("table//tr:nth-child(#{a})//td:nth-child(4)").inner_text, phone: @html.css("table//tr:nth-child(#{a})//td:nth-child(5)").inner_text )
#     end
# end
#
# @domain_chun = Array.new
#
# @domain_jook = [
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%B4%9D%EC%9E%A5+%EC%A7%81%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EB%B3%B8%EB%B6%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EA%B5%90%EC%9C%A1%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%EC%B1%85%EC%A4%91%EC%A0%90%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EC%9B%90&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
#     "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2"
#   ]
#
# @domain_jook.each do |x|
#   @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))
#   @row = @html.css("tr").length
#   1.upto(@row) do |a|
#       SchoolChun.create(belong: @html.css("table//tr:nth-child(#{a})//td:nth-child(3)").inner_text, name: @html.css("table//tr:nth-child(#{a})//td:nth-child(4)").inner_text, phone: @html.css("table//tr:nth-child(#{a})//td:nth-child(5)").inner_text )
#   end
# end
LectureInfo.create!(name: "경영학", l_type: "전공필수", time: 10, semester: 2, professor_id: 1)
LectureInfo.create!(name: "경제학", l_type: "전공선택", time: 10, semester: 2, professor_id: 1)
LectureEstimate.create(fun: 20, teaching: 40, get_grade: 60, teamwork_n_asg: 80, user_id: 1, lecture_info_id: 1, average: 23, reason: "학점")
LectureEstimate.create(fun: 40, teaching: 60, get_grade: 80, teamwork_n_asg: 100, user_id: 2, lecture_info_id: 1, average: 77, reason: "흥미")
LectureEstimate.create(fun: 60, teaching: 80, get_grade: 100, teamwork_n_asg: 60, user_id: 3, lecture_info_id: 2, average: 50,  reason: "배움")


#교수정보 가져오기
@professor = Array.new
@professor = [
  # #문과대학
  #  "http://www.dankook.ac.kr/web/kor/-152",
  #  "http://www.dankook.ac.kr/web/kor/-153",
  #  "http://www.dankook.ac.kr/web/kor/-154",
  #  "http://www.dankook.ac.kr/web/kor/-155",
  #  "http://www.dankook.ac.kr/web/kor/-156",
  # #법과대
  # "http://www.dankook.ac.kr/web/kor/-158",
  # #사회과학대학
  # "http://www.dankook.ac.kr/web/kor/-160",
  # "http://www.dankook.ac.kr/web/kor/-161",
  # "http://www.dankook.ac.kr/web/kor/-235",
  # "http://www.dankook.ac.kr/web/kor/-317",
  # "http://www.dankook.ac.kr/web/kor/-167",
  # "http://www.dankook.ac.kr/web/kor/-168",
  # #상경대
  # "http://www.dankook.ac.kr/web/kor/-171",
  # "http://www.dankook.ac.kr/web/kor/-172",
  # "http://www.dankook.ac.kr/web/kor/-318",
  # "http://www.dankook.ac.kr/web/kor/-175",
  # "http://www.dankook.ac.kr/web/kor/-52",
  # #자연대학(구학문)
  # "http://www.dankook.ac.kr/web/kor/-231",
  # "http://www.dankook.ac.kr/web/kor/-232",
  # "http://www.dankook.ac.kr/web/kor/-234",
  # "http://www.dankook.ac.kr/web/kor/-233",
  # #건축대학
  # "http://www.dankook.ac.kr/web/kor/-177",
  # "http://www.dankook.ac.kr/web/kor/-178",
  # #공과대학
  # "http://www.dankook.ac.kr/web/kor/-319",
  # "http://www.dankook.ac.kr/web/kor/-181",
  # "http://www.dankook.ac.kr/web/kor/-182",
  # "http://www.dankook.ac.kr/web/kor/-183",
  # "http://www.dankook.ac.kr/web/kor/-184",
  # "http://www.dankook.ac.kr/web/kor/-185",
  # "http://www.dankook.ac.kr/web/kor/-186",
  # "http://www.dankook.ac.kr/web/kor/-187",
  # "http://www.dankook.ac.kr/web/kor/-188",
  # "http://www.dankook.ac.kr/web/kor/-189",
  # #사범대
  # "http://www.dankook.ac.kr/web/kor/-191",
  # "http://www.dankook.ac.kr/web/kor/-192",
  # "http://www.dankook.ac.kr/web/kor/-193",
  # "http://www.dankook.ac.kr/web/kor/-194",
  # "http://www.dankook.ac.kr/web/kor/-195",
  # "http://www.dankook.ac.kr/web/kor/-196",
  # #예술대학
  # "http://www.dankook.ac.kr/web/kor/-197",
  # "http://www.dankook.ac.kr/web/kor/-198",
  # "http://www.dankook.ac.kr/web/kor/-320",
  # "http://www.dankook.ac.kr/web/kor/-202",
  # "http://www.dankook.ac.kr/web/kor/-203",
  # #음악대학
  # "http://www.dankook.ac.kr/web/kor/-205",
  # "http://www.dankook.ac.kr/web/kor/-207",
  # "http://www.dankook.ac.kr/web/kor/-208",
  # "http://www.dankook.ac.kr/web/kor/-209",
  # #국제대학
  # "http://www.dankook.ac.kr/web/kor/-211",
  # "http://www.dankook.ac.kr/web/kor/-212",
  # #교양대
  "http://www.dankook.ac.kr/web/kor/-150"
]

#주석 이해하기위해서는 위의 교수정보사이트의 HTML태그를 보면서 이해해야 함.
@professor.each do |x|
  @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))

  #교수들의 정보가 있는 div 태그의 줄
  @wraper_row = @html.css(".professor").length + @h4_row = @html.css(".portlet-body > div > h4").length

  #줄만큼 반복
  1.upto(@wraper_row) do |a|
    #h4태그 일떄(= 교수정보가 없는 태그일 때)
    if @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(1)").empty?

    #한줄에 2개의 교수정보 div가있을때
    elsif @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid").length == 2
     1.upto(2) do |b|
       doc = @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span8 > .name > span.more > a[href]").map { |link| link['href'] }
       Professor.create(
         name: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span8 > .name > a").search("a").remove.inner_text,
         belong: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid:nth-child(#{b}) > .span8 > .name").inner_text,

        #  intro: @html.at_xpath(".portlet-body//div//.professor.row-fluid:nth-child(#{a})//.span6.row-fluid:nth-child(#{b})//.span8//p.name//span.more//a[normalize-space(.)=img]")['href']
         intro_url: doc.join(",")
       )
     end

    #한줄에 1개의 교수정보 div가 있을 때
    else
     doc = @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid > .span8 > .name > span.more > a[href]").map { |link| link['href'] }
     Professor.create(
       name: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid > .span8 > .name > a").search("a").remove.inner_text,
       belong: @html.css(".portlet-body > div > .professor.row-fluid:nth-child(#{a}) > .span6.row-fluid > .span8 > .name").inner_text,

      #  intro: @html.at_xpath(".portlet-body//div//.professor.row-fluid:nth-child(#{a})//.span6.row-fluid:nth-child(#{b})//.span8//p.name//span.more//a[normalize-space(.)=img]")['href']
       intro_url: doc.join(",")
     )
    end
  end
end
