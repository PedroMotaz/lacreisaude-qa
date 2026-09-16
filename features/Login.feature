# language: pt

Funcionalidade: Login de usuario

Cenario: Login com e-mail ou senha incorreta
    Dado que estou na tela de login
    E preencho os campos obrigatorios com credenciais invalidas
    Quando tento realizar o login
    Entao devo visualizar a mensagem de erro "E-mail ou senha incorretos. Esqueceu a sua senha? Clique em "Esqueci minha senha" para recuperá-la."

Cenario: Login com sucesso
    Dado que estou na tela de login
    E preencho os campos obrigatorios com credenciais validas
    Quando realizo o login
    Entao devo ir pra tela de busca de profissionais

Cenario: Login com conta nao confirmada
    Dado que estou na tela de login
    E preencho os campos obrigatorios com uma conta nao confirmada
    Quando tento realizar o login
    Entao devo visualizar a mensagem de erro "Voce nao tem permissao para executar esta acao"
