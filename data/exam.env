require 'json'
require_relative 'app/models/exam'  # Certifique-se de que o caminho está correto

# Lendo o JSON
file = File.read('./data/exams.json')
data = JSON.parse(file)

# Percorrendo cada exame e salvando no modelo Exam
data.each do |exam_data|
  exam_instance = Exam.new(
    title: exam_data['title'],
    year: exam_data['year'],
    disciplines: exam_data['disciplines'].map { |d| d['value'] },
    languages: exam_data['languages'].map { |l| l['value'] }
  )

  if exam_instance.save
    puts "Exam instance for #{exam_instance.title} saved successfully!"
  else
    puts "Failed to save Exam instance for #{exam_instance.title}: #{exam_instance.errors.full_messages.join(", ")}"
  end
end