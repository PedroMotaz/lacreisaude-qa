# QA Desafio Técnico - Lacrei Saúde

## Objetivo

Documentar e validar o comportamento da aplicação em ambiente de staging, registrando os resultados dos testes, bugs encontrados e possíveis melhorias.

## Ambiente de testes

**Ambiente:** Staging

**Aplicação:**
https://paciente-staging.lacreisaude.com.br/

## Estrutura do projeto

```text
lacreisaude-qa/
├── .github/
│   └── workflows/
│       └── cypress.yml
├── cypress/
│   ├── e2e/
│   │   └── features/
│   │       ├── cadastro.feature
│   │       ├── pos-cadastro.feature
│   │       └── busca-profissional.feature
│   └── support/
│       └── step_definitions/
│           ├── cadastro.js
│           ├── pos-cadastro.js
│           └── busca-profissional.js
├── evidencias/
│   ├── relatorios/
│   └── videos/
├── features/
│   ├── BuscaProfissional.feature
│   ├── Cadastro.feature
│   ├── Login.feature
│   ├── PosCadastro.feature
│   └── RecuperacaoSenha.feature
├── performance/
│   └── busca-profissional.js
├── cypress.config.js
├── cypress.env.json.example
├── package.json
└── README.md
```

## Testes funcionais

Foram realizados testes funcionais manuais nas seguintes funcionalidades:

- Login
- Cadastro
- Pós-cadastro
- Busca de profissionais
- Contato/agendamento
- Recuperação de senha

Os cenários dos testes funcionais foram documentados utilizando Gherkin e estão disponíveis no diretório `features/`.

## Execução dos testes manuais

Os testes foram executados manualmente utilizando o ambiente de staging.

Foram avaliados fluxos positivos, negativos e validações de campos, além da navegação entre as principais telas da aplicação.

Os resultados dos testes, evidências e bugs encontrados estão documentados no Notion.

## Execução dos testes automatizados

Os testes automatizados usam Cypress + Cucumber e ficam em `cypress/e2e/features/`.

Os steps ficam em `cypress/support/step_definitions/`.

Crie um arquivo `cypress.env.json` a partir de `cypress.env.json.example` com as credenciais de staging.

```bash
npm install
npx cypress install
npm test
npm run test:open
npm run test:cadastro
npm run test:pos-cadastro
npm run test:busca
```

Fluxos automatizados:

- Cadastro
- Pós-cadastro
- Busca de profissional → contato/SMS

Os steps do Cucumber executam os comandos Cypress de verdade (visita, preenchimento, clique e asserção na UI de staging).

## Relatórios

Após `npm test`, o relatório HTML fica em `evidencias/relatorios/index.html`, com as funcionalidades, cenários e steps.

Os vídeos da execução ficam em `evidencias/videos/`.

No GitHub Actions, relatórios, vídeos e screenshots são publicados como artifact `relatorios-cypress` em cada execução.

## CI/CD

O workflow `.github/workflows/cypress.yml` roda em todo `push` e `pull_request`.

O cenário de cadastro executa sempre.

Pós-cadastro e busca não executam por conta da autenticação manual no email.

## Documentação

Os cenários funcionais estão documentados em Gherkin no diretório `features/`.

A documentação complementar dos testes, resultados, acessibilidade, responsividade, performance, bugs e melhorias está disponível no Notion.

Os bugs identificados também estão registrados como GitHub Issues.

## Checklist de segurança

- Não armazenar tokens ou credenciais no repositório.
- Não adicionar dados pessoais reais aos arquivos de teste.
- Não versionar informações sensíveis.
- Utilizar variáveis de ambiente para informações sensíveis durante a automação.
- Revisar arquivos antes de realizar commits para evitar exposição de credenciais ou tokens.

## Performance

Os testes de performance foram realizados utilizando Lighthouse e k6.

Foram avaliados:

- Performance da aplicação em dispositivos mobile e desktop.
- Tempo de resposta de operações críticas.
- Busca de profissionais sob carga.
- Cenário com aproximadamente 30 usuários concorrentes.

Os resultados detalhados estão documentados no Notion.

## Acessibilidade

Foram realizados testes de acessibilidade considerando:

- Navegação utilizando teclado.
- Leitura e navegação utilizando NVDA.
- Contraste.
- Legibilidade.
- Auditoria utilizando Lighthouse.

Os resultados detalhados e as evidências estão documentados no Notion.

## Responsividade

A aplicação foi avaliada em diferentes tamanhos de tela, considerando:

- Dispositivos mobile com largura de até 600px.
- Dispositivos desktop com largura superior a 1024px.
- Layout.
- Funcionalidade.
- Usabilidade.

Os resultados e problemas encontrados estão documentados no Notion.

## Bugs e melhorias

Os bugs encontrados durante os testes foram registrados como GitHub Issues, contendo:

- Descrição do problema.
- Passos para reprodução.
- Resultado esperado.
- Resultado atual.
- Impacto.
- Prioridade.
- Evidências.
- Sugestão de melhoria quando aplicável.

Os detalhes completos dos bugs e melhorias também estão documentados no Notion.

## Rollback

Como os testes manuais são realizados em ambiente de staging e não realizam alterações permanentes na aplicação, não foi necessário executar rollback durante esta etapa.

Para os testes automatizados, caso sejam implementadas ações que alterem dados, serão utilizados dados de teste controlados e uma estratégia de limpeza ou reversão dos dados após a execução.