class Tarefa < ApplicationRecord
  belongs_to :user

  def hora
    attributes['hora'].strftime('%H:%M')
  end

  def self.to_csv
    attributes = %i[nome data hora]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |tarefa|
        csv << attributes.map { |attr| tarefa.send(attr) }
      end
    end
  end

  
end
