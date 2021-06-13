class Tarefa < ApplicationRecord
  belongs_to :user

  def hora
    attributes['hora'].strftime('%H:%M')
  end
end
