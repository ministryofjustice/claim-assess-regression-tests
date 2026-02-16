import dotenv from 'dotenv';
import path from 'path';

const env = process.env.TEST_ENV || 'local';

dotenv.config({
  path: path.resolve(process.cwd(), `.env.${env}`)
});

console.log(`Loaded ENV: ${env}`);
console.log(`BASE_URL: ${process.env.BASE_URL}`);
