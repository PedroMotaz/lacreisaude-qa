# language: pt

Funcionalidade: Recuperar senha 

Cenario: Redefinicao com sucesso
    dado que estou na tela redefinir-senha
    e insiro um email valido
    e abro o link enviado pro email
    quando preencho os campos com senhas validas
    entao serei encaminhado pra tela de "senha alterada com sucesso"

Cenario: Tentativa de reutilizar senha antiga
    dado que estou na tela de Cadastre nova senha
    quando inserir minha senha antiga
    entao ira aparecer a mensagem de erro "Uma nova senha nao pode ser igaul a atual"


Cenario: Recuperacao com e-mail nao cadastrado
    dado que estou na tela redefinir-senha
    e no campo de email eu insira um que não esta cadastrado
    quando efetuo o envio do link
    entao ira aparecer a mensagem de erro "Nao foi possivel enviar o link para o seu e-mail"

Cenario: Utilizacao de link expirado
    dado que estou na tela redefinir senha
    e solicito um novo link de recuperacao
    e possuo um link de recuperacao anterior
    quando tento redefinir a senha atraves do link anterior
    entao sou levado pra tela de link expirado