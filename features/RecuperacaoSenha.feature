# language: pt

Funcionalidade: Recuperar senha

Cenario: Redefinicao com sucesso
    Dado que estou na tela redefinir-senha
    E insiro um email valido
    E abro o link enviado pro email
    Quando preencho os campos com senhas validas
    Entao serei encaminhado pra tela de "senha alterada com sucesso"

Cenario: Tentativa de reutilizar senha antiga
    Dado que estou na tela de Cadastre nova senha
    Quando inserir minha senha antiga
    Entao ira aparecer a mensagem de erro "Uma nova senha nao pode ser igaul a atual"

Cenario: Recuperacao com e-mail nao cadastrado
    Dado que estou na tela redefinir-senha
    E no campo de email eu insira um que nao esta cadastrado
    Quando efetuo o envio do link
    Entao ira aparecer a mensagem de erro "Nao foi possivel enviar o link para o seu e-mail"

Cenario: Utilizacao de link expirado
    Dado que estou na tela redefinir senha
    E solicito um novo link de recuperacao
    E possuo um link de recuperacao anterior
    Quando tento redefinir a senha atraves do link anterior
    Entao sou levado pra tela de link expirado
