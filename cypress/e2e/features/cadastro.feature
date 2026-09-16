# language: pt

Funcionalidade: Cadastro de pessoa usuaria

Cenario: Preencher o formulario de cadastro com dados validos
    Dado que estou na tela de cadastro
    Quando preencho o formulario com dados validos
    E aceito os termos obrigatorios
    E submeto o cadastro
    Entao devo visualizar a tela de verificacao de e-mail
    E posso voltar para a tela de login
