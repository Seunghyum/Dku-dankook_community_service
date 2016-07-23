RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.role == "슈퍼관리자"
  end

  config.model 'RehearsalLecture' do
    visible false
  end
  config.model "Rehearsal" do
    visible false
  end
  config.model "RehearsalUser" do
    visible false
  end
  config.model "BookList" do
    visible false
  end
  config.model "Bookable" do
    visible false
  end
  config.model "LockerParticular" do
    visible false
  end
  config.model "SchoolChun" do
    visible false
  end
  config.model "SchoolJook" do
    visible false
  end

  config.model 'Meeting' do
    configure :start_time, :date do
      date_format :default
    end
    configure :end_time, :date do
      date_format :default
    end
    configure :type_class do
      visible false
    end
  end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  # config.model LectureEstimates do
  #   configure :name do
  #     label "Team's name"
  #   end
  # end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
