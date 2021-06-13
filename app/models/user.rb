# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :tarefas, dependent: :destroy
  validates :cpf, cpf: { message: I18n.t('api.validators.mensagem.cpf') }
  validates :telefone, telefone: { message: I18n.t('api.validators.mensagem.telefone') }
end
