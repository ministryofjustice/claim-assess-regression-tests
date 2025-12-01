import { Page } from 'playwright';

export class HomePage {
  readonly page: Page;
   readonly url = 'https://laa-claim-for-payment-frontend-uat.cloud-platform.service.justice.gov.uk/';

  constructor(page: Page) {
    this.page = page;
  }

  async goto() {
    await this.page.goto(this.url);
  }

  get signInButton() {
    return this.page.locator('button:has-text("Sign in")');

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

  get usernameInput() {
  return this.page.getByRole('textbox', { name: 'Username' });
}

get passwordInput() {
  return this.page.getByRole('textbox', { name: 'Password' });
}

async login(username: string, password: string) {
  await this.usernameInput.fill(username);
  await this.passwordInput.fill(password);
  // await this.signInButton.click();
}

}
