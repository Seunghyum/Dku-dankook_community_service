ActiveAdmin.register Major do
  permit_params :name

  index do
      column :id
      column :name
      actions
  end

  filter :name

  form do |f|
      f.inputs "학과 관리" do
          f.semantic_errors *f.object.errors.keys
          f.input :name
      end
      f.actions
  end
end
