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

  async init() {
    this.browser = await chromium.launch({ headless: false, slowMo: 100 });
    this.context = await this.browser.newContext();
    this.page = await this.context.newPage();

    // Create only once
    this.homePage = new HomePage(this.page);
  }

  async teardown() {
    await this.page.close();
    await this.context.close();
    await this.browser.close();
  }
}

setWorldConstructor(CustomWorld);
// export { CustomWorld };

Before(async function () {
  console.log('🌍 Initializing browser...');
  await this.init();
});

After(async function () {
  console.log('🌍 Tearing down browser...');
  await this.teardown();
});
