const fs = require('fs');
const path = require('path');
const { defineConfig } = require('cypress');
const createBundler = require('@bahmutov/cypress-esbuild-preprocessor');
const { addCucumberPreprocessorPlugin, afterSpecHandler, afterRunHandler } = require('@badeball/cypress-cucumber-preprocessor');
const { createEsbuildPlugin } = require('@badeball/cypress-cucumber-preprocessor/esbuild');

async function setupNodeEvents(on, config) {
    await addCucumberPreprocessorPlugin(on, config, {
        omitAfterSpecHandler: true,
        omitAfterRunHandler: true,
    });

    on('file:preprocessor', createBundler({
        plugins: [createEsbuildPlugin(config)],
    }));

    on('after:spec', async (spec, results) => {
        await afterSpecHandler(config, spec, results);

        if (!results || !results.video) {
            return;
        }

        const evidencias = path.join(config.projectRoot, 'evidencias', 'videos');
        fs.mkdirSync(evidencias, { recursive: true });
        fs.copyFileSync(results.video, path.join(evidencias, path.basename(results.video)));
    });

    on('after:run', async (results) => {
        await afterRunHandler(config, results);

        const jsonDir = path.join(config.projectRoot, 'cypress', 'reports', 'json');
        const reportPath = path.join(config.projectRoot, 'evidencias', 'relatorios');

        if (!fs.existsSync(jsonDir) || fs.readdirSync(jsonDir).filter((file) => file.endsWith('.json')).length === 0) {
            return;
        }

        require('./cypress/support/gerar-relatorio').generate(jsonDir, reportPath);
    });

    return config;
}

module.exports = defineConfig({
    e2e: {
        baseUrl: 'https://paciente-staging.lacreisaude.com.br',
        specPattern: 'cypress/e2e/features/**/*.feature',
        supportFile: 'cypress/support/e2e.js',
        setupNodeEvents,
        viewportWidth: 390,
        viewportHeight: 844,
        defaultCommandTimeout: 15000,
        pageLoadTimeout: 60000,
        video: true,
        screenshotOnRunFailure: true,
        trashAssetsBeforeRuns: false,
    },
});
