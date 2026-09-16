# language: pt

Funcionalidade: Pos-cadastro do usuario

Cenario: Preenchimento do onboarding
    Dado que estou na tela de recortes-sociais
    Quando respondo as perguntas sobre pronome, etnia, genero, sexualidade e deficiencia
    Entao as respostas devem ser registradas

Cenario: Selecao de multiplas deficiencias
    Dado que estou na tela de recortes-sociais
    E preencho as demais perguntas
    Quando seleciono multiplas deficiencias
    Entao devo conseguir concluir o onboarding

Cenario: Selecao de "Nenhuma"
    Dado que estou na tela de recortes-sociais
    E preencho as demais perguntas
    E seleciono uma ou mais opcoes de deficiencia
    Quando seleciono a opcao "Nenhuma"
    Entao as demais opcoes selecionadas devem ser des-selecionadas

Cenario: Preenchimento da opcao "Outra"
    Dado que estou na tela de recortes-sociais
    E preencho as demais perguntas
    E seleciono a opcao "Outra" em deficiencias
    Quando tento concluir o onboarding sem preencher a descricao
    Entao devo visualizar uma mensagem de validacao "Este campo e obrigatorio."
    E nao devo conseguir concluir o onboarding

Cenario: Finalizacao do onboarding
    Dado que estou na tela de recortes-sociais
    E respondo todas as perguntas
    Quando concluo o onboarding
    Entao sou encaminhado pra tela de cadastro concluido

Cenario: Edicao das respostas
    Dado que estou na tela cadastro concluido
    Quando seleciono a opcao "Editar" meus dados
    Entao sou levado de volta para a tela de onboarding

Cenario: Prosseguir para busca
    Dado que estou na tela cadastro concluido
    Quando seleciono a opcao para prosseguir para busca de profissionais
    Entao sou encaminhado para a tela de busca de profissionais
