import { Given, Then, When } from '@cucumber/cucumber';
import { HomePage } from '../pages/HomePage';
import { expect } from '@playwright/test';
import {LoginPage} from "../pages/LoginPage";

console.log('✅ loginSteps.ts is loaded');

Given('I log in to Claim as user {string} with password {string}', async function (username: string, password: string) {

  const claimUrl = process.env.CLAIM_BASE_URL || 'http://localhost:3000';

  console.log("TEST_ENV =", process.env.TEST_ENV);
  console.log("CLAIM_BASE_URL =", claimUrl);

  this.homePage = new HomePage(this.page);
  await this.homePage.goto(claimUrl);

  const loginPage = new LoginPage(this.page);
  await loginPage.login(username, password);
});

Given('I log in to Assess as user {string} with password {string}', async function (username: string, password: string) {

  const assessUrl = process.env.ASSESS_BASE_URL || 'http://localhost:3001';

  console.log("ASSESS_BASE_URL =", assessUrl);

  this.homePage = new HomePage(this.page);
  await this.homePage.goto(assessUrl);

  const loginPage = new LoginPage(this.page);
  await loginPage.login(username, password);
});

Then('I should see the heading {string}', async function (expected: string) {
  const heading = await this.page.locator('h1').textContent();
  console.log('Page heading is:', heading);
  expect(heading).toBe(expected);
});

Then('I should see the page title {string}', async function (expected: string) {

  await this.page.waitForLoadState('domcontentloaded');
  const title = await this.page.title();

  console.log('Page title is:', title);

  expect(title).toBe(expected);
});

When('I enter valid credentials', async function () {

  this.homePage = new HomePage(this.page);

  await this.page.waitForLoadState('domcontentloaded');

  await this.page
    .getByRole('textbox', { name: 'Username' })
    .waitFor({ state: 'visible' });

  await this.homePage.login('bob', 'password');

});

When('I click the Sign In button', async function () {

  await this.page
    .getByRole('button', { name: 'Sign in' })
    .click();

});

Then('I should see the following Elements', async function (dataTable) {

  const expectedElements: string[] =
    dataTable.raw().slice(1).map((row: unknown[]) => row[0]);

  for (const text of expectedElements) {

    const locator = this.page.locator(`text=${text}`);

    await expect(locator).toBeVisible({ timeout: 5000 });

    console.log(expectedElements);

  }

});

When('I click the Start button', async function () {
  return 'pending';
});

When('I click sign out button', async function () {

  await this.page
    .getByRole('link', { name: 'Sign out' })
    .click();

});

When('I click on {string} link', async function (linkName: string) {
  await this.page
    .getByRole('link', { name: new RegExp(`^${linkName}`) })
    .click();
});
