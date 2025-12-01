import { Page } from 'playwright';

export class LoginPage {
  readonly page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  get someElement() {
    return this.page.locator('selector-for-next-page-element');
  }

  async assertSomeElementVisible() {
    await this.someElement.waitFor({ state: 'visible' });
  }
}
