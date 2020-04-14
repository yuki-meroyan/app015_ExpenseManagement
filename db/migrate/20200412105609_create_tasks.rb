class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string      :title        , null: false
      t.string      :client_user  , null: false
      t.string      :client_name  , null: false
      t.text        :detail       , null: false
      t.date        :request_date , null: false
      t.date        :delivery_date, null: false
      t.integer     :status       , default: 1
      t.references  :group        , null: false, foreign_key: true
      t.timestamps
    end
  end
end
