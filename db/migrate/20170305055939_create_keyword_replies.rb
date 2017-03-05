class CreateKeywordReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_replies do |t|
      t.string :keyword   , null: false
      t.string :reply_type, null: false
      t.string :reply_word, null: false

      t.timestamps
    end
    add_index :keyword_replies, :keyword, unique: true
  end
end
