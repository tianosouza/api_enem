require 'json'
require_relative 'app/models/year'  # Certifique-se de que o caminho está correto

# Lendo o JSON
file = File.read('./data/details.json')
data = JSON.parse(file)

# Criando e salvando a instância do modelo Year
year_instance = Year.new(
  title: data['title'],
  year: data['year'],
  disciplines: data['disciplines'].map { |d| d['value'] },
  languages: data['languages'],
  questions: data['questions']
)

if year_instance.save
  puts "Year instance saved successfully!"
else
  puts "Failed to save Year instance: #{year_instance.errors.full_messages.join(", ")}"
end