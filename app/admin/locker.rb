ActiveAdmin.register Locker do
  permit_params :limit_num, :counting, :major_id, :start_time, :end_time

  index do
      column :major_id
      column :limit_num
      column :counting
      column :start_time
      column :end_time
      column :updated_at
      actions
  end

  filter :limit_num
  filter :counting
  filter :major_id
  filter :updated_at
  filter :start_time
  filter :end_time

  form do |f|
      f.inputs "학과 관리" do
          f.semantic_errors *f.object.errors.keys
          f.input :limit_num
          f.input :counting
          f.input :major_id
          f.input :start_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
          f.input :end_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
      end
      f.actions
  end
end
