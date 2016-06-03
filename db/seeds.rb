# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "moon", gender: "남자", email: 'qwe@qwe.com', password: "12341234", password_confirmation: "12341234")
Board.create(name: "자유게시판", description: "자유롭게 말하세요")
Board.create(name: "토론장", description: "단국대 지성인답게 말씀하세요")

40.times do
    Post.create(title: "테스트 타이틀", content: "내용테스트", user_id: 1, board_id: 1)
end

#사물함 갯수 제한( 전체 사물함 갯수 - 이미 지정된 사물함 갯수 )
Major.create(mname: "국제경영" )

Major.create(mname: "모바일" )

#노코기리 전화번호부 긁어오기
require 'nokogiri'

@domain_jook = Array.new
@domain_jook = [
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%B4%9D%EC%9E%A5%20%EC%A7%81%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EB%B3%B8%EB%B6%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EA%B5%90%EC%9C%A1%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%EC%B1%85%EC%A4%91%EC%A0%90%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EC%9B%90&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%82%B0%ED%95%99%ED%98%91%EB%A0%A5%EB%8B%A8%28%EC%A3%BD%EC%A0%84%29&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1",
    "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=1"
]
@domain_jook.each do |x|
    @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))

    @row = @html.css("tr").length

    1..@row.times do |a|
        SchoolJook.create(belong: @html.css("table//tr:nth-child(#{a})//td:nth-child(3)").inner_text, name: @html.css("table//tr:nth-child(#{a})//td:nth-child(4)").inner_text, phone: @html.css("table//tr:nth-child(#{a})//td:nth-child(5)").inner_text )
    end
end

@domain_chun = Array.new

@domain_jook = [
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EC%B4%9D%EC%9E%A5+%EC%A7%81%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EB%B3%B8%EB%B6%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EA%B5%90%EC%9C%A1%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%EC%B1%85%EC%A4%91%EC%A0%90%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%B6%80%EC%84%A4%EC%97%B0%EA%B5%AC%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80%EA%B8%B0%EA%B4%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EB%8C%80%ED%95%99%EC%9B%90&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    # "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B5%90%ED%95%99%ED%96%89%EC%A0%95%ED%8C%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2",
    "http://www.dankook.ac.kr/web/kor/-60?p_p_id=Phone_WAR_empInfoportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_count=2&_Phone_WAR_empInfoportlet_root=%EA%B8%B0%ED%83%80&_Phone_WAR_empInfoportlet_action=view&_Phone_WAR_empInfoportlet_dept_loct_cd=2"
  ]
@domain_jook.each do |x|
    @html = Nokogiri::HTML(Net::HTTP.get(URI(x)))

    @row = @html.css("tr").length

    1..@row.times do |a|
        SchoolChun.create(belong: @html.css("table//tr:nth-child(#{a})//td:nth-child(3)").inner_text, name: @html.css("table//tr:nth-child(#{a})//td:nth-child(4)").inner_text, phone: @html.css("table//tr:nth-child(#{a})//td:nth-child(5)").inner_text )
    end
end
