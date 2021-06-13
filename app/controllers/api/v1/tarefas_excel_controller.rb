# frozen_string_literal: true

# Load Excel
class Api::V1::TarefasExcelController < ApplicationController
  before_action :authenticate_user!
  require 'roo'

  def create
    @params = request.POST
    # In this example the model MyFile has_attached_file :attachment
    workbook = Roo::Spreadsheet.open(@params['agenda'])
    workbook.parse(headers: true)
    last_row = workbook.last_row

    (1..last_row).each do |i|
      Tarefa.create(
        nome: workbook.cell(i, 1),
        data: workbook.cell(i, 2),
        hora: workbook.cell(i, 3),
        user: current_user
      )
    end
  end
end
