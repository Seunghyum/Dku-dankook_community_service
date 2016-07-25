ActiveAdmin.register Post do

    permit_params :board_id, :user_id, :title, :content, :attachment, :image_url

    index do
        column :board_id
        column :user_id
        column :title
        column :content
        column :attachment
        column :hits
        column :cached_votes_score
        column :image_url
        actions
    end

  filter :board_id
  filter :user_id
  filter :title
  filter :content
  filter :attachment
  filter :hits
  filter :image_url
  filter :cached_votes_score

    form do |f|
        f.inputs "게시글 관리" do
            f.semantic_errors *f.object.errors.keys
            f.input :board_id
            f.input :user_id
            f.input :title
            f.input :content
            f.input :attachment
            f.input :image_url
        end
        f.actions
    end
end
