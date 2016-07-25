ActiveAdmin.register Major do
  permit_params :name, :locker_time, :book_time

  index do
      column :id
      column :name
      column :locker_time
      column :book_time
      actions
  end

  filter :name
  filter :locker_time
  filter :book_time

  form do |f|
      f.inputs "학과 관리" do
          f.semantic_errors *f.object.errors.keys
          f.input :name
          f.input :locker_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
          f.input :book_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
      end
      f.actions
  end
end
