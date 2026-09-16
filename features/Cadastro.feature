# language: pt

Funcionalidade: Cadastro de usuario

Cenario: Cadastro com dados validos
    dado que estou na tela de cadastro
    e preencho os campos obrigatorios com dados validos
    e concordo com as politicas de privacidade
    e confirmo ter mais de 18 anos
    quando tento realizar o cadastro
    entao devo visualizar a tela de verificar email 


Cenario: Cadastro com e-mail ja utilizado
    dado que estou na tela de cadastro
    e preencho os campos obrigatorios com dados validos 
    e informo um email que ja possui cadastro
    quando tento realizar o cadastro
    entao devo visualizar a mensagem de erro "Ja existe um usuario cadastrado com este endereco de e-mail."


Cenario: Cadastro com senhas divergentes
    dado que estou na tela de cadastro
    e preencho os campos obrigatorios com dados validos
    quando informo uma senha de confirmacao diferente da senha cadastrada
    entao devo visualizar a mensagem de erro "Senhas incompativeis, tente novamente." 
    e o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro sem campos obrigatorios
    dado que estou na tela de cadastro
    e os campos obrigatorios nao sao preenchidos
    quando tento realizar o cadastro
    entao todos os campos obrigatorios devem apresentar uma mensagem de validacao
    e o botao "Cadastrar" deve permanecer desabilitado


Cenario: Cadastro com senha invalida
    dado que estou na tela de cadastro
    e preencho os demais campos obrigatorios corretamente
    quando informo uma senha que nao atende aos requisitos minimos
    Entao os requisitos nao atendidos devem ser indicados como invalidos 
    e o botao "Cadastrar" deve permanecer desabilitado


cenario: Cadastro com e-mails divergentes
    dado que estou na tela de cadastro
    e preencho os campos obrigatorios
    quando insiro e-mails divergentes 
    entao aparecera abaixo do campo divergente a mensagem de erro "Os e-mails nao correspondem, digite novamente."
    e o botao "Cadastrar" deve permanecer desabilitado


Cenario: Cadastro sem aceitar termos
    dado que estou na tela de cadastro
    e preencho os campos obrigatorios   
    e aceito os termos de uso e politica de privacidade
    quando removo a confirmacao dos termos
    Entao devo visualizar a mensagem de erro "Voce precisa concordar com os termos de uso e politica de privacidade."
    e o botao "Cadastrar" deve permanecer desabilitado

Cenario: Cadastro sem confirmar maioridade
    dado que estou na tela de cadastro
    e preencho os campos obrigatorios   
    e confirmo ter 18 anos ou mais
    quando removo minha confirmacao de maioridade
    entao devo visualizar a mensagem de erro "Voce deve ter 18 anos ou mais"
    e o botao "Cadastrar" deve permanecer desabilitado
