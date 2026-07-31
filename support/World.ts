import {Before, After, setWorldConstructor, BeforeAll, AfterAll} from '@cucumber/cucumber';
import { Browser, BrowserContext, Page, chromium } from 'playwright';
import { setDefaultTimeout } from '@cucumber/cucumber';

setDefaultTimeout(10 * 1000); // 10 seconds

let browser!: Browser;
let context!: BrowserContext;

class CustomWorld {
  page!: Page;
  baseUrl!: string;

  async init() {
    this.page = await context.newPage();
  }

  async teardown() {
    await this.page?.close().catch(() => {});
  }
}

setWorldConstructor(CustomWorld);

BeforeAll(async () => {
  console.log("🌍 Launching browser...");

  const headless = process.env.HEADLESS === "true";
  const slowMo = headless ? 0 : 100;
  browser = await chromium.launch({ headless, slowMo });
  context = await browser.newContext();
});

AfterAll(async () => {
  console.log("🌍 Closing browser...");

  await context?.close().catch(() => {});
  await browser?.close().catch(() => {});
});

Before({ tags: "@claim" }, async function () {
  console.log("🌍 Initializing browser for CLAIM app...");

  this.baseUrl = process.env.CLAIM_BASE_URL || "http://localhost:3000";
  await this.init();
});

Before({ tags: "@assess" }, async function () {
  console.log("🌍 Initializing browser for ASSESS app...");

  this.baseUrl = process.env.ASSESS_BASE_URL || "http://localhost:3001";
  await this.init();
});

After(async function () {
  console.log('🌍 Tearing down browser...');

  await this.teardown();
});