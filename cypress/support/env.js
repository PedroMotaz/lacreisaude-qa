function requiredEnv(name) {
    return cy.env([name]).then((env) => {
        const value = env[name];

        if (!value) {
            throw new Error(`Defina a variavel "${name}" em cypress.env.json`);
        }

        return value;
    });
}

function optionalEnv(name, fallback) {
    return cy.env([name]).then((env) => env[name] || fallback);
}

module.exports = { requiredEnv, optionalEnv };
