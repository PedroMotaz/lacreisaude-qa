const { Given, When, Then } = require('@badeball/cypress-cucumber-preprocessor');
const { optionalEnv } = require('../env');

Given('que estou logado com uma conta com cadastro concluido', () => {
    cy.loginFromEnv();
    cy.contains('button', 'Pesquisar').should('be.visible');
});

When('pesquiso por um profissional', () => {
    cy.contains('button', 'Pesquisar').click();
});

When('seleciono um profissional para agendamento', () => {
    cy.get('#atendimentos').click();
});

When('acesso as informacoes de contato', () => {
    cy.get('button[aria-label="Ir para informações de contato da pessoa profissional"]').click();
});

When('preencho meu numero de celular', () => {
    optionalEnv('phone', '11999999999').then((phone) => {
        cy.get('#requesterPhoneNumber').click().clear().type(phone, { delay: 100 });
        cy.get('#requesterPhoneNumber').should('not.have.value', '');
    });
});

When('solicito o envio do codigo', () => {
    cy.get('button[aria-label="Enviar código para o número de celular inserido"]')
        .should('be.visible')
        .should('be.enabled')
        .click();
});

Then('devo visualizar a tela de verificacao do codigo', () => {
    cy.contains('código').should('be.visible');
});
