# language: pt

Funcionalidade: Busca profissional

Cenario: Buscar profissional
    Dado que estou na tela de Buscar
    Quando insiro na barra de pesquisa o que procuro
    Entao devo visualizar profissionais relacionados aos termos pesquisados

Cenario: Iniciar contato/agendamento
    Dado que encontrei um profissional desejado
    Quando prossigo em "agendar consulta"
    Entao sou direcionado para a pagina do profissional onde posso agendar o atendimento

Cenario: Validacao do numero de celular
    Dado que estou na tela "Contatar Profissional"
    Quando insiro um numero de celular invalido
    Entao devo visualizar uma mensagem de validacao "Número de celular incorreto. Digite novamente."
    E nao devo conseguir prosseguir

Cenario: Envio do codigo de verificacao
    Dado que estou na tela "Contatar Profissional"
    E informo um numero de celular valido
    Quando solicito o envio do codigo
    Entao devo receber um codigo de verificacao no numero informado

Cenario: Validacao do codigo
    Dado que solicitei um codigo de verificacao
    Quando informo um codigo invalido
    Entao devo visualizar a mensagem de erro "Código incorreto. Verifique se digitou corretamente ou solicite um novo código."
    E nao devo conseguir prosseguir
