require './createUFFMail.rb'

def menu
    if @firstTime
        puts
        puts "-------- Bem-vindo --------"
        puts
        @firstTime = false
    end
    puts "---------- MENU ----------"
    puts
    puts "Digite a opção desejada:"
    puts
    puts "1 - Criar UFFMail"
    puts "0 - Sair"
    
    opt = nil
    loop do
        opt = gets.chomp.to_i
        if opt < 0 or opt > 1
            puts "Digite uma opção válida."
        end
    break if opt == 0 or opt == 1
    end

    puts

    case opt
    when 1
        createUFFMail
    end
end

@firstTime = true
