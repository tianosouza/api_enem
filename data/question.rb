require 'json'
require 'active_record'
require_relative 'app/models/question'  # Certifique-se de que o caminho está correto
require_relative 'app/models/exam'      # Certifique-se de que o caminho está correto

# Definindo o caminho base
base_path = './data'

# Percorrendo os diretórios de anos de 2009 a 2023
(2009..2023).each do |year|
  year_path = File.join(base_path, year.to_s, 'questions')

  # Verificando se o diretório de questões existe
  next unless Dir.exist?(year_path)

  # Encontrando o exame correspondente ao ano
  exam = Exam.find_by(year: year)
  next unless exam

  # Percorrendo os diretórios de 1 a 180
  (1..180).each do |question_number|
    question_path = File.join(year_path, question_number.to_s)

    # Verificando se o diretório da questão existe
    next unless Dir.exist?(question_path)

    # Lendo o arquivo details.json
    details_file = File.join(question_path, 'details.json')
    next unless File.exist?(details_file)

    file = File.read(details_file)
    data = JSON.parse(file)

    # Criando e salvando a instância do modelo Question
    question_instance = Question.new(
      title: data['title'],
      index: data['index'],
      year: data['year'],
      language: data['language'],
      discipline: data['discipline'],
      context: data['context'],
      files: data['files'],
      correct_alternative: data['correctAlternative'],
      alternatives_introduction: data['alternativesIntroduction'],
      alternatives: data['alternatives'],
      exam_id: exam.id  # Atribuindo o exam_id
    )

    if question_instance.save
      puts "Question instance for year #{year}, question #{question_number} saved successfully!"
    else
      puts "Failed to save Question instance for year #{year}, question #{question_number}: #{question_instance.errors.full_messages.join(", ")}"
    end
  end
end
