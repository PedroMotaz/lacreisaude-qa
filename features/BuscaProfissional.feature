# language: pt

Funcionalidade: Busca profissional

Cenario: Buscar profissional
    dado que estou na tela de Buscar
    quando insiro na barra de pesquisa o que procuro
    entao devo visualizar profissionais relacionados aos termos pesquisados

Cenario: Iniciar contato/agendamento
    dado que encontrei um profissional desejado
    quando prossigo em "agendar consulta"
    entao sou direcionado para a pagina do profissional onde posso agendar o atendimento

Cenario: Validacao do numero de celular
    dado que estou na tela "Contatar Profissional"
    quando insiro um numero de celular invalido
    entao devo visualizar uma mensagem de validacao "Número de celular incorreto. Digite novamente."
    e nao devo conseguir prosseguir

Cenario: Envio do codigo de verificacao
    dado que estou na tela "Contatar Profissional"
    e informo um numero de celular valido
    quando solicito o envio do codigo
    entao devo receber um codigo de verificacao no numero informado

Cenario: Validacao do codigo
    dado que solicitei um codigo de verificacao
    quando informo um codigo invalido
    entao devo visualizar uma mensagem de erro "Código incorreto. Verifique se digitou corretamente ou solicite um novo código."
    e nao devo conseguir prosseguir

    