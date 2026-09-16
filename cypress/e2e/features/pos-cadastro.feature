# language: pt

Funcionalidade: Pos-cadastro da pessoa usuaria

Cenario: Concluir o onboarding e ir para busca de profissionais
    Dado que estou logado com uma conta pendente de cadastro
    Quando continuo o cadastro
    E respondo as perguntas de recortes sociais
    E concluo o cadastro
    Entao devo visualizar a opcao de buscar profissionais
