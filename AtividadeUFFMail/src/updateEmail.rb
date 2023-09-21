require 'csv'

def updateEmail(matricula, uffmail)

    dbAluno = CSV.parse(File.read(PATH), headers: true)
    for i in 0..(dbAluno.length - 1)
        if dbAluno[i]["matricula"] == matricula
            dbAluno[i]["uffmail"] = uffmail
        end
    end
    #como o parse tira o header do arquivo, foi necessario adicionar o header manualmente
    addHeader = CSV.open(PATH,'w')
    addHeader << ["nome","matricula","telefone","email","uffmail","status"]
    addHeader.close
    #adiciona todo o conteudo da table dbAluno no arquivo csv
    File.open(PATH,'a'){ |f| f << dbAluno.map(&:to_csv).join }
end