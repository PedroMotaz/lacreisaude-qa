# language: pt

Funcionalidade: Busca de profissionais

Cenario: Buscar profissional e iniciar agendamento
    Dado que estou logado com uma conta com cadastro concluido
    Quando pesquiso por um profissional
    E seleciono um profissional para agendamento
    E acesso as informacoes de contato
    E preencho meu numero de celular
    E solicito o envio do codigo
    Entao devo visualizar a tela de verificacao do codigo
