# language: pt

Funcionalidade: Pos-cadastro do usuario

Cenario: Preenchimento do onboarding
    dado que estou na tela de recortes-sociais
    quando respondo as perguntas sobre pronome, etnia, genero, sexualidade e deficiencia
    entao as respostas devem ser registradas


Cenario: Selecao de multiplas deficiencias
    dado que estou na tela de recortes-sociais
    e preencho as demais perguntas
    quando seleciono multiplas deficiencias 
    entao devo conseguir concluir o onboarding


Cenario: Selecao de "Nenhuma"
    dado que estou na tela de recortes-sociais
    e preencho as demais perguntas
    e seleciono uma ou mais opcoes de deficiencia
    quando seleciono a opcao "Nenhuma"
    entao as demais opcoes selecionadas devem ser des-selecionadas


Cenario: Preenchimento da opcao "Outra"
    dado que estou na tela de recortes-sociais
    e preencho as demais perguntas
    e seleciono a opcao "Outra" em deficiencias
    quando tento concluir o onboarding sem preencher a descricao
    entao devo visualizar uma mensagem de validacao "Este campo e obrigatorio."
    e nao devo conseguir concluir o onboarding


Cenario: Finalizacao do onboarding
    dado que estou na tela de recortes-sociais
    e respondo todas as perguntas 
    quando concluo o onboarding
    entao sou encaminhado pra tela de cadastro concluido

Cenario: Edicao das respostas
    dado que estou na tela cadastro concluido
    quando seleciono a opcao "Editar" meus dados
    entao sou levado de volta para a tela de onboarding

Cenario: Prosseguir para busca
    dado que estou na tela cadastro concluido
    quando seleciono a opcao para prosseguir para busca de profissionais
    entao sou encaminhado para a tela de busca de profissionais