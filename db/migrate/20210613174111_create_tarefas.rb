class CreateTarefas < ActiveRecord::Migration[6.1]
  def change
    create_table :tarefas do |t|
      t.string :nome
      t.date :data
      t.time :hora
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
