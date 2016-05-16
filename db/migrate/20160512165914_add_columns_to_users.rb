class AddColumnsToUsers < ActiveRecord::Migration
  def change
    # name : 페이스북 사용자명을 저장할 속성
    # provider : 인증서비스 제공업체명을 저장할 속성 (예, facebook, twitter 등)
    # uid : 사용자 아이디를 저장할 속성
    # image : 페이스북의 프로필 이미지 주소를 저장할 속성

    add_column :users, :name, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string
  end
end
