require 'csv'

def generateEmails(nome)
    emailSuffix = "@id.uff.br"

    emails = Array.new
    emails.push(nome.split.first.downcase + '_' + nome.split.at(1).downcase + emailSuffix)
    emails.push(nome.split.first.downcase + nome.split.at(1).chars.first.downcase + nome.split.last.chars.first.downcase +  emailSuffix)
    emails.push(nome.split.first.downcase + nome.split.last.downcase + emailSuffix)
    emails.push(nome.chars.first.downcase + nome.split.last.downcase + emailSuffix)
    emails.push(nome.split.first.chars.first.downcase + nome.split.at(1).downcase + nome.split.last.downcase + emailSuffix)
    return emails
end