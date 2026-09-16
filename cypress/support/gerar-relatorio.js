const fs = require('fs');
const path = require('path');

function escapeHtml(value) {
    return String(value)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;');
}

function durationMs(nanoseconds) {
    return Math.round((nanoseconds || 0) / 1e6);
}

function featureSlug(feature) {
    const fromUri = feature.uri ? path.basename(feature.uri, '.feature') : feature.name;
    return String(fromUri)
        .toLowerCase()
        .replace(/\\/g, '/')
        .split('/')
        .pop()
        .replace(/\.feature$/i, '')
        .replace(/[^a-z0-9-]+/g, '-');
}

function summary(features) {
    const scenarios = features.flatMap((feature) => feature.elements || []);
    const steps = scenarios.flatMap((scenario) => scenario.steps || []);

    return {
        scenarios,
        steps,
        passed: steps.filter((step) => step.result && step.result.status === 'passed').length,
        failed: steps.filter((step) => step.result && step.result.status === 'failed').length,
    };
}

function featuresHtml(features) {
    return features.map((feature) => {
        const scenariosHtml = (feature.elements || []).map((scenario) => {
            const scenarioFailed = (scenario.steps || []).some((step) => step.result && step.result.status === 'failed');
            const stepsHtml = (scenario.steps || []).map((step) => {
                const status = step.result ? step.result.status : 'unknown';
                const ms = step.result ? durationMs(step.result.duration) : 0;
                const error = step.result && step.result.error_message
                    ? `<pre>${escapeHtml(step.result.error_message)}</pre>`
                    : '';

                return `<li class="step ${status}"><span>${escapeHtml(step.keyword)}${escapeHtml(step.name)}</span><em>${ms} ms</em>${error}</li>`;
            }).join('');

            return `<article class="scenario ${scenarioFailed ? 'failed' : 'passed'}"><h3>${escapeHtml(scenario.keyword)}: ${escapeHtml(scenario.name)}</h3><ul>${stepsHtml}</ul></article>`;
        }).join('');

        return `<section class="feature"><h2>${escapeHtml(feature.keyword)}: ${escapeHtml(feature.name)}</h2>${scenariosHtml}</section>`;
    }).join('');
}

function page(title, features, linksHtml) {
    const stats = summary(features);

    return `<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <title>${escapeHtml(title)}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 32px; color: #1f2933; background: #f4f6f8; }
        h1, h2, h3 { margin: 0 0 12px; }
        .summary, .links { display: flex; gap: 16px; flex-wrap: wrap; margin-bottom: 24px; }
        .card, .links a { background: #fff; padding: 16px 20px; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,.08); color: #1f2933; text-decoration: none; }
        .links a:hover { background: #e4e7eb; }
        .feature { background: #fff; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 1px 3px rgba(0,0,0,.08); }
        .scenario { margin-top: 16px; padding-top: 16px; border-top: 1px solid #e4e7eb; }
        ul { list-style: none; padding: 0; margin: 0; }
        .step { display: flex; justify-content: space-between; gap: 16px; padding: 8px 12px; border-radius: 6px; margin-bottom: 6px; }
        .passed { background: #e8f7ee; }
        .failed { background: #fde8e8; }
        .step em { color: #616e7c; font-style: normal; }
        pre { white-space: pre-wrap; margin: 8px 0 0; }
    </style>
</head>
<body>
    <h1>${escapeHtml(title)}</h1>
    ${linksHtml || ''}
    <div class="summary">
        <div class="card">Features: ${features.length}</div>
        <div class="card">Cenarios: ${stats.scenarios.length}</div>
        <div class="card">Steps passados: ${stats.passed}</div>
        <div class="card">Steps falhos: ${stats.failed}</div>
    </div>
    ${featuresHtml(features)}
</body>
</html>`;
}

function readJson(filePath) {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function generate(jsonDir, reportPath) {
    if (!fs.existsSync(jsonDir)) {
        return;
    }

    const archiveDir = path.join(jsonDir, 'features');
    fs.mkdirSync(archiveDir, { recursive: true });

    const incoming = path.join(jsonDir, 'cucumber.json');

    if (fs.existsSync(incoming)) {
        const features = readJson(incoming);

        features.forEach((feature) => {
            const slug = featureSlug(feature);
            const target = path.join(archiveDir, `${slug}.json`);
            const incomingFailed = (feature.elements || []).some((scenario) => (
                scenario.steps || []
            ).some((step) => step.result && step.result.status === 'failed'));

            if (incomingFailed) {
                return;
            }

            fs.writeFileSync(target, JSON.stringify([feature], null, 2));
        });
    }

    const archived = fs.readdirSync(archiveDir)
        .filter((file) => file.endsWith('.json'))
        .sort()
        .flatMap((file) => readJson(path.join(archiveDir, file)));

    if (archived.length === 0) {
        return;
    }

    const links = archived.map((feature) => {
        const slug = featureSlug(feature);
        return `<a href="${slug}.html">${escapeHtml(feature.name)}</a>`;
    }).join('');

    fs.mkdirSync(reportPath, { recursive: true });
    fs.writeFileSync(path.join(reportPath, 'index.html'), page('Relatorio Cypress + Cucumber', archived, `<div class="links">${links}</div>`));
    fs.writeFileSync(path.join(reportPath, 'cucumber-report.html'), page('Relatorio Cypress + Cucumber', archived, `<div class="links">${links}</div>`));

    archived.forEach((feature) => {
        const slug = featureSlug(feature);
        fs.writeFileSync(path.join(reportPath, `${slug}.html`), page(feature.name, [feature], '<div class="links"><a href="index.html">Voltar ao consolidado</a></div>'));
    });

    const cypressReports = path.dirname(jsonDir);
    fs.mkdirSync(cypressReports, { recursive: true });
    fs.writeFileSync(path.join(cypressReports, 'cucumber-report.html'), page('Relatorio Cypress + Cucumber', archived, `<div class="links">${links}</div>`));
}

module.exports = { generate };
