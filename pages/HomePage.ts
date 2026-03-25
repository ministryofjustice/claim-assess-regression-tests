import { Page } from 'playwright';

export class HomePage {

  readonly page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  async goto(url: string) {
    if (!url) {
      throw new Error('URL is not provided');
    }

    await this.page.goto(url);
  }

  get heading() {
    return this.page.locator('h1');
  }

  async assertHeadingText(expected: string) {
    await this.page.waitForSelector('h1');
    const text = await this.heading.textContent();

    if (text?.trim() !== expected) {
      throw new Error(`Heading text was "${text}", but expected "${expected}"`);
    }
  }
}