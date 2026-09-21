import dotenv from 'dotenv';
import path from 'path';

const env = process.env.TEST_ENV || 'local';

dotenv.config({
  path: path.resolve(process.cwd(), `.env.${env}`)
});

export const ENV = {
  assessBaseUrl: process.env.ASSESS_BASE_URL!,
  claimBaseUrl: process.env.CLAIM_BASE_URL!,
};

console.log(`Loaded ENV: ${env}`);
console.log(`ASSESS_BASE_URL: ${process.env.ASSESS_BASE_URL}`);
console.log(`CLAIM_BASE_URL: ${process.env.CLAIM_BASE_URL}`);