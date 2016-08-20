ActiveAdmin.register Major do
  permit_params :name, :locker_start_time, :locker_end_time, :book_start_time, :book_end_time

  index do
      column :id
      column :name
      column :locker_start_time
      column :locker_end_time
      column :book_start_time
      column :book_end_time
      actions
  end

  filter :name
  filter :locker_start_time
  filter :locker_end_time
  filter :book_start_time
  filter :book_end_time

  form do |f|
      f.inputs "학과 관리" do
          f.semantic_errors *f.object.errors.keys
          f.input :name
          f.input :locker_start_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
          f.input :locker_end_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
          f.input :book_start_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}
          f.input :book_end_time, :as => :string, :input_html => {:class => "hasDatetimePicker"}

      end
      f.actions
  end
end
