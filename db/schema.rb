# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160716120220) do

  create_table "best_fives", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "book_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "num_of_book"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bookables", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.integer  "counting"
    t.string   "giver"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookables", ["book_id"], name: "index_bookables_on_book_id"
  add_index "bookables", ["user_id"], name: "index_bookables_on_user_id"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "bgiver"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "post_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "comments", ["cached_votes_down"], name: "index_comments_on_cached_votes_down"
  add_index "comments", ["cached_votes_score"], name: "index_comments_on_cached_votes_score"
  add_index "comments", ["cached_votes_total"], name: "index_comments_on_cached_votes_total"
  add_index "comments", ["cached_votes_up"], name: "index_comments_on_cached_votes_up"
  add_index "comments", ["cached_weighted_average"], name: "index_comments_on_cached_weighted_average"
  add_index "comments", ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score"
  add_index "comments", ["cached_weighted_total"], name: "index_comments_on_cached_weighted_total"
  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "lecture_estimates", force: :cascade do |t|
    t.string   "reason"
    t.integer  "average",                 default: 0
    t.integer  "fun",                     default: 0
    t.integer  "teaching",                default: 0
    t.integer  "get_grade",               default: 0
    t.integer  "teamwork_n_asg",          default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.integer  "lecture_info_id"
    t.text     "msg"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "lecture_estimates", ["cached_votes_down"], name: "index_lecture_estimates_on_cached_votes_down"
  add_index "lecture_estimates", ["cached_votes_score"], name: "index_lecture_estimates_on_cached_votes_score"
  add_index "lecture_estimates", ["cached_votes_up"], name: "index_lecture_estimates_on_cached_votes_up"
  add_index "lecture_estimates", ["cached_weighted_average"], name: "index_lecture_estimates_on_cached_weighted_average"
  add_index "lecture_estimates", ["cached_weighted_score"], name: "index_lecture_estimates_on_cached_weighted_score"
  add_index "lecture_estimates", ["cached_weighted_total"], name: "index_lecture_estimates_on_cached_weighted_total"
  add_index "lecture_estimates", ["lecture_info_id"], name: "index_lecture_estimates_on_lecture_info_id"
  add_index "lecture_estimates", ["user_id"], name: "index_lecture_estimates_on_user_id"

  create_table "lecture_infos", force: :cascade do |t|
    t.string   "name"
    t.string   "l_type"
    t.integer  "time"
    t.integer  "semester"
    t.integer  "male_view",         default: 0
    t.integer  "female_view",       default: 0
    t.integer  "all_view",          default: 0
    t.integer  "av_fun",            default: 0
    t.integer  "av_teaching",       default: 0
    t.integer  "av_get_grade",      default: 0
    t.integer  "av_teamwork_n_asg", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "professor_id"
    t.integer  "average",           default: 0
    t.string   "div_color"
    t.integer  "best_five_id"
    t.string   "review"
  end

  add_index "lecture_infos", ["best_five_id"], name: "index_lecture_infos_on_best_five_id"
  add_index "lecture_infos", ["professor_id"], name: "index_lecture_infos_on_professor_id"

  create_table "locker_particulars", force: :cascade do |t|
    t.integer  "locker_id"
    t.integer  "user_id"
    t.string   "type",       default: "일반"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "locker_particulars", ["locker_id"], name: "index_locker_particulars_on_locker_id"
  add_index "locker_particulars", ["user_id"], name: "index_locker_particulars_on_user_id"

  create_table "lockers", force: :cascade do |t|
    t.integer  "limit_num"
    t.integer  "counting",   default: 0
    t.integer  "major_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "lockers", ["major_id"], name: "index_lockers_on_major_id"

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "locker_id"
    t.datetime "locker_time"
    t.datetime "book_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "majors", ["locker_id"], name: "index_majors_on_locker_id"
  add_index "majors", ["user_id"], name: "index_majors_on_user_id"

  create_table "meetings", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
    t.string   "display_tag"
    t.datetime "end_time"
    t.string   "event_type"
    t.string   "type_class"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "attachment"
    t.integer  "user_id"
    t.integer  "hits",                    default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "board_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "image_url"
  end

  add_index "posts", ["board_id"], name: "index_posts_on_board_id"
  add_index "posts", ["cached_votes_down"], name: "index_posts_on_cached_votes_down"
  add_index "posts", ["cached_votes_score"], name: "index_posts_on_cached_votes_score"
  add_index "posts", ["cached_votes_total"], name: "index_posts_on_cached_votes_total"
  add_index "posts", ["cached_votes_up"], name: "index_posts_on_cached_votes_up"
  add_index "posts", ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average"
  add_index "posts", ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score"
  add_index "posts", ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "professors", force: :cascade do |t|
    t.string   "name"
    t.string   "belong"
    t.string   "intro_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rehearsal_lectures", force: :cascade do |t|
    t.string   "lnum"
    t.string   "divide"
    t.string   "name"
    t.integer  "score"
    t.string   "teacher"
    t.string   "ldate"
    t.integer  "limit_num"
    t.integer  "counting",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rehearsal_users", force: :cascade do |t|
    t.string   "user_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rehearsals", force: :cascade do |t|
    t.string   "counting",             default: "0"
    t.integer  "rehearsal_user_id"
    t.integer  "rehearsal_lecture_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "rehearsals", ["rehearsal_lecture_id"], name: "index_rehearsals_on_rehearsal_lecture_id"
  add_index "rehearsals", ["rehearsal_user_id"], name: "index_rehearsals_on_rehearsal_user_id"

  create_table "school_chuns", force: :cascade do |t|
    t.string   "belong"
    t.string   "name"
    t.string   "phone"
    t.string   "campus",     default: "천안"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "school_jooks", force: :cascade do |t|
    t.string   "belong"
    t.string   "name"
    t.string   "phone"
    t.string   "campus",     default: "죽전"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "school_phone_searchings", force: :cascade do |t|
    t.string   "campus",     default: ""
    t.string   "belong",     default: ""
    t.string   "phone",      default: ""
    t.string   "name",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "profile"
    t.string   "role",                   default: "일반학생"
    t.string   "username"
    t.string   "gender"
    t.integer  "lnum"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "comment_id"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "photo"
    t.integer  "lcounting"
    t.integer  "major_id"
  end

  add_index "users", ["comment_id"], name: "index_users_on_comment_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["major_id"], name: "index_users_on_major_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
