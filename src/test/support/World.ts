import {After, AfterAll, Before, BeforeAll, setDefaultTimeout, setWorldConstructor} from '@cucumber/cucumber';
import {Browser, BrowserContext, chromium, Page} from 'playwright';
import {SignOutLink} from "../components/Link";

setDefaultTimeout(30 * 1000); // 30 seconds

let browser!: Browser;
let context!: BrowserContext;

class CustomWorld {
  page!: Page;

  async init(baseUrl: string) {
    this.page = await context.newPage();
    await this.page.goto(baseUrl);
  }

  async teardown() {
    if (!this.page) {
      return;
    }

    const signOutLink = new SignOutLink(this.page);

    if (await signOutLink.isVisible()) {
      await signOutLink.click();
    }

    await this.page.close().catch(() => {});
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

  const baseUrl = process.env.CLAIM_BASE_URL || "http://localhost:3000";
  await this.init(baseUrl);
});

Before({ tags: "@assess" }, async function () {
  console.log("🌍 Initializing browser for ASSESS app...");

  const baseUrl = process.env.ASSESS_BASE_URL || "http://localhost:3001";
  await this.init(baseUrl);
});

After(async function () {
  console.log('🌍 Tearing down browser...');

  await this.teardown();
});