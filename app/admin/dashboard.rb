ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do

      column do
        panel "최근 생성된 계정" do
          table_for User.last(10) do
            column("#")   {|user| user.id}
            column("별명"){|user| link_to(user.username, admin_user_path(user))}
            column("생성일")   {|user| user.created_at}
          end
        end
      end

      column do
        panel "Tag" do
          if ActsAsTaggableOn::Tag.first.present?
            table_for ActsAsTaggableOn::Tag.order('taggings_count desc').limit(10) do
              column("태그명")   {|tag| tag.name}
              column("사용 횟수"){|tag| tag.taggings_count }
              # column("생성 시간")   {|tag| tag.taggings.first.created_at} if tag.taggings.first.present?
              # column("마지막 사용")   {|tag| tag.taggings.last.created_at} if tag.taggings.first.present?
            end
          end
        end
      end

    end # columns
  end # content
end
