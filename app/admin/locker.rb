ActiveAdmin.register Locker do
  permit_params :limit_num, :counting, :major_id

  index do
      column :major_id
      column :limit_num
      column :counting
      column :updated_at
      actions
  end

  filter :limit_num
  filter :counting
  filter :major_id
  filter :updated_at

  form do |f|
      f.inputs "학과 관리" do
          f.semantic_errors *f.object.errors.keys
          f.input :limit_num
          f.input :counting
          f.input :major_id
      end
      f.actions
  end
end
