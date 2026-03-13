import { Before, After, setWorldConstructor } from '@cucumber/cucumber';
import { Browser, BrowserContext, Page, chromium } from 'playwright';
import { setDefaultTimeout } from '@cucumber/cucumber';
import { HomePage } from '../pages/HomePage';

setDefaultTimeout(10 * 1000); // 10 seconds

class CustomWorld {
  browser!: Browser;
  context!: BrowserContext;
  page!: Page;
  homePage!: HomePage;

  baseUrl!: string;

  async init() {
    const headless = process.env.CI === "true";
    const slowMo = headless ? 0 : 100;

    this.browser = await chromium.launch({ headless, slowMo });
    this.context = await this.browser.newContext();
    this.page = await this.context.newPage();

    this.homePage = new HomePage(this.page);
  }

  async teardown() {
    await this.page?.close().catch(() => {});
    await this.context?.close().catch(() => {});
    await this.browser?.close().catch(() => {});
  }

  setApp(app: "claim" | "assess") {
    if (app === "claim") {
      this.baseUrl = process.env.CLAIM_BASE_URL || "http://localhost:3000";
    } else {
      this.baseUrl = process.env.ASSESS_BASE_URL || "http://localhost:3001";
    }
  }
}

setWorldConstructor(CustomWorld);

Before({ tags: "@claim" }, async function () {
  console.log("🌍 Initializing browser for CLAIM app...");
  this.setApp("claim");
  await this.init();
});

Before({ tags: "@assess" }, async function () {
  console.log("🌍 Initializing browser for ASSESS app...");
  this.setApp("assess");
  await this.init();
});

After(async function () {
  console.log('🌍 Tearing down browser...');
  await this.teardown();
});