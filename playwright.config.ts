/* eslint-disable no-console */
import { defineConfig } from '@playwright/test';
import * as dotenv from 'dotenv';
import * as path from 'path';


const env = process.env.TEST_ENV || 'local';


dotenv.config({
  path: path.resolve(process.cwd(), `.env.${env}`)
});

// verifying that the correct environment variables are loaded
console.log(`Running tests in ${env} environment`);
console.log('BASE_URL:', process.env.BASE_URL);

export default defineConfig({
  use: {
    baseURL: process.env.BASE_URL,
    headless: true  
  }
});