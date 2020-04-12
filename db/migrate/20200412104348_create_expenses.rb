class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.date        :order_date   , null: false, index: true
      t.integer     :year         , null: false
      t.integer     :month        , null: false
      t.integer     :day          , null: false
      t.string      :content      , null: false
      t.integer     :income_spend , null: false
      t.integer     :price        , null: false
      t.text        :remarks
      t.string      :receipt_file_name
      t.string      :receipt_file
      t.integer     :account_no   , null: false
      t.references  :group        , null: false, foreign_key: true
      t.references  :user         , null: false, foreign_key: true
      t.timestamps
    end
  end
end
