const { Given, When, Then } = require('@badeball/cypress-cucumber-preprocessor');

Given('que estou logado com uma conta pendente de cadastro', () => {
    cy.loginFromEnv();
    cy.contains('Continuar cadastro').should('be.visible');
});

When('continuo o cadastro', () => {
    cy.contains('Continuar cadastro').click();
});

When('respondo as perguntas de recortes sociais', () => {
    cy.get('#pronoun-EL').check({ force: true });
    cy.get('button[aria-label="ir para a proxima página"]').click();
    cy.get('#ethnicGroup-PR').check({ force: true });
    cy.get('button[aria-label="ir para a proxima página"]').click();
    cy.get('#genderIdentity-NB').check({ force: true });
    cy.get('button[aria-label="ir para a proxima página"]').click();
    cy.get('#sexuality-PA').check({ force: true });
    cy.get('button[aria-label="ir para a proxima página"]').click();
    cy.get('#disabilityTypes-VI').check({ force: true });
});

When('concluo o cadastro', () => {
    cy.get('[data-qa-id="concluir-cadastro"]').click();
});

Then('devo visualizar a opcao de buscar profissionais', () => {
    cy.get('button').contains('Buscar profissionais').should('be.visible').click();
});
