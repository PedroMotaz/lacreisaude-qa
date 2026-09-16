import http from 'k6/http';

export const options = {
    vus: 30,
    iterations: 30,
};

export default function () {
    const response = http.get(
        'https://api-staging.lacreisaude.com.br/v1/lacreisaude/professionals/',
        {
            cookies: {
                gp_aid: __ENV.K6_TOKEN,
            },
        }
    );

    console.log(response.status);
}
