const { Given, When, Then } = require('@badeball/cypress-cucumber-preprocessor');

Given('que estou na tela de cadastro', () => {
    cy.visit('/saude/paciente/cadastrar/');
    cy.contains('Cadastrar').should('be.visible');
});

When('preencho o formulario com dados validos', () => {
    const email = `qa.lacreisaude.${Date.now()}@gmail.com`;
    const password = 'Senha@Forte123';

    cy.get('#firstName').scrollIntoView().clear().type('Maria');
    cy.get('#lastName').scrollIntoView().clear().type('Souza');
    cy.get('#email').scrollIntoView().clear().type(email, { delay: 20 });
    cy.get('#email2').scrollIntoView().clear().type(email, { delay: 20 });
    cy.get('#password1').scrollIntoView().clear().type(password, { delay: 20, log: false });
    cy.get('#password2').scrollIntoView().clear().type(password, { delay: 20, log: false }).blur();
});

When('aceito os termos obrigatorios', () => {
    cy.get('#is18YearsOldOrMore').check();
    cy.get('#acceptedPrivacyDocument').check();
});

When('submeto o cadastro', () => {
    cy.intercept('POST', '**/api-staging.lacreisaude.com.br/**').as('cadastro');
    cy.get('button[aria-label="Criar cadastro no site Lacrei Saúde"]')
        .should('be.enabled')
        .click();
    cy.wait('@cadastro').then(({ response }) => {
        expect(response.statusCode, JSON.stringify(response.body)).to.be.oneOf([200, 201, 204]);
    });
});

Then('devo visualizar a tela de verificacao de e-mail', () => {
    cy.contains('Estamos quase lá').should('be.visible');
});

Then('posso voltar para a tela de login', () => {
    cy.get('button').contains('Voltar ao login').click();
    cy.get('#email').should('be.visible');
});
