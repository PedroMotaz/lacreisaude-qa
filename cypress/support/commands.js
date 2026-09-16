const { requiredEnv } = require('./env');

Cypress.Commands.add('login', (email, password) => {
    cy.visit('/login/');
    cy.get('#email').clear().type(email, { parseSpecialCharSequences: false });
    cy.get('#password').clear().type(password, { log: false, parseSpecialCharSequences: false });
    cy.get('button[aria-label="Entrar na conta"]').click();
});

Cypress.Commands.add('loginFromEnv', () => {
    requiredEnv('email').then((email) => {
        requiredEnv('password').then((password) => {
            cy.login(email, password);
        });
    });
});
