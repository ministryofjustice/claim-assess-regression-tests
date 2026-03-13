/* eslint-disable no-console */
import { defineConfig } from '@playwright/test';
import * as dotenv from 'dotenv';
import * as path from 'path';

const env = process.env.TEST_ENV || 'local';

dotenv.config({
  path: path.resolve(process.cwd(), `.env.${env}`)
});

const CLAIM_BASE_URL = process.env.CLAIM_BASE_URL || 'http://localhost:3000';
const ASSESS_BASE_URL = process.env.ASSESS_BASE_URL || 'http://localhost:3001';

/*
Determine which application tests are running
Default = claim
*/
const APP = process.env.APP || 'claim';

const BASE_URL =
  APP === 'assess'
    ? ASSESS_BASE_URL
    : CLAIM_BASE_URL;

console.log(`Running tests in ${env} environment`);
console.log(`Application: ${APP}`);
console.log(`BASE_URL: ${BASE_URL}`);

export default defineConfig({
  use: {
    baseURL: BASE_URL,
    headless: true
  }
});