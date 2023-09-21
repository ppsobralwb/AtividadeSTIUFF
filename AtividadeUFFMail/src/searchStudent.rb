require 'csv'
require './class/Aluno.rb'

def searchStudent(matricula)

    db_aluno = CSV.parse(File.read(PATH), headers: true)
    aluno = nil
    for i in 0..(db_aluno.length - 1)
        if db_aluno[i]["matricula"] == matricula
            aluno = Aluno.new(db_aluno[i]["nome"], db_aluno[i]["matricula"], db_aluno[i]["telefone"], 
            db_aluno[i]["email"], db_aluno[i]["uffmail"], db_aluno[i]["status"])
        end
    end
    return aluno
end