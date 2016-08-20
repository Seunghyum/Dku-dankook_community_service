ActiveAdmin.register UsedBook do
  permit_params :btitle, :bgiver, :n_edition, :real_or_copy, :user_id, :major_id

  index do
      column :btitle
      column :bgiver
      column :n_edition
      column :real_or_copy
      column :user_id
      column :major_id
      column :created_at
      column :updated_at
      actions
  end

  filter :btitle
  filter :bgiver
  filter :n_edition
  filter :real_or_copy
  filter :user_id
  filter :major_id
  filter :updated_at

  form do |f|
      f.inputs "학과 관리" do
          f.semantic_errors *f.object.errors.keys
          f.input :btitle
          f.input :bgiver
          f.input :n_edition
          f.input :real_or_copy
          f.input :user_id
          f.input :major_id
      end
      f.actions
  end
end
