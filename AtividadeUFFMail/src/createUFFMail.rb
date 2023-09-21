require 'csv'
require './class/Aluno.rb'
require './searchStudent.rb'
require './updateEmail.rb'
require './generateEmails.rb'

def createUFFMail

    puts "Digite a sua matricula:"
    matricula = gets.chomp

    aluno = searchStudent(matricula)

    if aluno.nil?
        puts
        puts "Matrícula não encontrada."
        puts
    elsif aluno.status == "Inativo"
        puts
        puts "Esta matrícula está inativa, é preciso que ela esteja ativa para criar um UFFMail."
        puts
    elsif !aluno.uffmail.nil?
        puts
        puts "Esta matricula já possui um UFFMail cadastrado."
        puts
    else
        puts
        puts "#{aluno.nome.split.first}, por favor escolha uma das opções abaixo para o seu UFFMail"
        lista_emails = generateEmails(aluno.nome)
        for i in 0..(lista_emails.length - 1)
            puts "#{i+1} - #{lista_emails[i]}"
        end
        puts
        opt = nil
        loop do
            opt= gets.chomp.to_i
            if opt<= 0 or opt> lista_emails.length
                puts
                puts "Digite uma opção válida."
                puts
            end
        break if opt> 0 and opt<= lista_emails.length
        end
        aluno.uffmail = lista_emails[opt-1]
        
        updateEmail(aluno.matricula, aluno.uffmail)

        puts
        puts "A criação do seu email (#{aluno.uffmail}) será feita nos próximos minutos."
        puts "Um SMS foi enviado para #{aluno.telefone} com a sua senha de acesso."
        puts

    end
    sleep(3)
    menu
end