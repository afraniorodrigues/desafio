class TelefoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # return if value.blank?
    return if telefone_valid?(value)

    record.errors.add(
      attribute,
      :invalid_cpf,
      message: options[:message] || 'is not valid',
      value: value
    )
  rescue StandardError
    false
  end

  private

  def telefone_valid?(telefone)
    telefone.match(/\(\d{2}\)\s\d{4,5}\-\d{4}/)
  rescue StandardError
    false
  end
end
