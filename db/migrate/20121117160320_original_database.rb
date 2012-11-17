class OriginalDatabase < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  "name"
      t.string  "email"
      t.boolean "admin"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :blog_posts do |t|
      t.string  "title"
      t.text    "content"
      t.date    "date"
      t.integer "created_by"
      t.integer "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :statistics do |t|
      t.string  "name"
      t.string  "value"
    end
  end
end
