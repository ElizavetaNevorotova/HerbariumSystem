module BotanistsHelper
  def botanists_collection
    Botanist.select(:id, :first_name, :last_name, :patronymic).map do |botanist|
      [full_name_with_initials(botanist), botanist.id]
    end
  end

  def full_name_with_initials(botanist)
    fio = "#{botanist.last_name}"
    fio.concat " #{botanist.first_name.first.upcase}." if botanist.first_name
    fio.concat " #{botanist.patronymic.first.upcase}." if botanist.patronymic
  end
end
