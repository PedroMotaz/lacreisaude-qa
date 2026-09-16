# language: pt

Funcionalidade: login de usuario

Login com e-mail ou senha incorreta
    dado que estou na tela de login
    e preencho os campos obrigatorios com credenciais invalidas    
    quando tento realizar o login
    entao devo visualizar a mensagem de erro  "E-mail ou senha incorretos. Esqueceu a sua senha? Clique em "Esqueci minha senha" para recuperá-la." 

Login com sucesso
    dado que estou na tela de login
    e preencho os campos obrigatorios com credenciais validas 
    quando realizo o login
    entao devo ir pra tela de busca de profissionais

Login com conta nao confirmada
    dado que estou na tela de login 
    e preencho os campos obrigatorios com uma conta nao confirmada
    quando tento realizar o login
    entao devo visualizar a mensagem de erro "Voce nao tem permissao para executar esta acao"