# language: pt

Funcionalidade: Cadastro de usuario

Cenario: Cadastro com dados validos
    Dado que estou na tela de cadastro
    E preencho os campos obrigatorios com dados validos
    E concordo com as politicas de privacidade
    E confirmo ter mais de 18 anos
    Quando tento realizar o cadastro
    Entao devo visualizar a tela de verificar email

Cenario: Cadastro com e-mail ja utilizado
    Dado que estou na tela de cadastro
    E preencho os campos obrigatorios com dados validos
    E informo um email que ja possui cadastro
    Quando tento realizar o cadastro
    Entao devo visualizar a mensagem de erro "Ja existe um usuario cadastrado com este endereco de e-mail."

Cenario: Cadastro com senhas divergentes
    Dado que estou na tela de cadastro
    E preencho os campos obrigatorios com dados validos
    Quando informo uma senha de confirmacao diferente da senha cadastrada
    Entao devo visualizar a mensagem de erro "Senhas incompativeis, tente novamente."
    E o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro sem campos obrigatorios
    Dado que estou na tela de cadastro
    E os campos obrigatorios nao sao preenchidos
    Quando tento realizar o cadastro
    Entao todos os campos obrigatorios devem apresentar uma mensagem de validacao
    E o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro com senha invalida
    Dado que estou na tela de cadastro
    E preencho os demais campos obrigatorios corretamente
    Quando informo uma senha que nao atende aos requisitos minimos
    Entao os requisitos nao atendidos devem ser indicados como invalidos
    E o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro com e-mails divergentes
    Dado que estou na tela de cadastro
    E preencho os campos obrigatorios
    Quando insiro e-mails divergentes
    Entao aparecera abaixo do campo divergente a mensagem de erro "Os e-mails nao correspondem, digite novamente."
    E o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro sem aceitar termos
    Dado que estou na tela de cadastro
    E preencho os campos obrigatorios
    E aceito os termos de uso e politica de privacidade
    Quando removo a confirmacao dos termos
    Entao devo visualizar a mensagem de erro "Voce precisa concordar com os termos de uso e politica de privacidade."
    E o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro sem confirmar maioridade
    Dado que estou na tela de cadastro
    E preencho os campos obrigatorios
    E confirmo ter 18 anos ou mais
    Quando removo minha confirmacao de maioridade
    Entao devo visualizar a mensagem de erro "Voce deve ter 18 anos ou mais"
    E o botao "Cadastrar" deve permanecer desabilitado
