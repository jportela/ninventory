class Item < ActiveRecord::Base
  CATEGORIES = ['Livros', 'Software', 'Hardware', 'Outros']
  STATUS_CODES = ["Disponível", "Requisitado", "Perdido / Estragado"]
  
  validates_presence_of :name, :message => "O nome tem de ser inserido."
  validates_inclusion_of :category, :in => CATEGORIES
  validates_inclusion_of :status, :in => STATUS_CODES
  
  def validate
    if status == "Requisitado" && (holder.nil? || holder == "")
      errors.add_to_base "O requisitante deve ser preenchido."
    end
  end
end
