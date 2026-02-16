import { Given, Then, When } from '@cucumber/cucumber';
import { HomePage } from '../pages/HomePage';
import { expect } from '@playwright/test';
// import { LoginPage } from '../pages/loginPage'; 

console.log('✅ loginSteps.ts is loaded');

Given('I am on the Claim for Payment home page', async function () {

  
  console.log("TEST_ENV =", process.env.TEST_ENV);
console.log("BASE_URL =", process.env.BASE_URL);
  console.log('PAGE IS:', this.page); 
  this.homePage = new HomePage(this.page);
  await this.homePage.goto(this.url);
  return Promise.resolve();

});

Given('I am on the Assess home page', async function () {

  this.homePage = new HomePage(this.page);
  await this.homePage.goto(this.url);
  return Promise.resolve();

});

 Then('I should see the heading {string}', async function (headingName: string) {

  switch (headingName) {
  case 'Your service name – GOV.UK':
  { const title = await this.page.title();
  expect(title).toBe(headingName);
  break; }

case 'Return to claims':
      await this.page.getByRole('link', { name: 'Return to claims' }).click();
      break;

  }

});

Then('I should see the page heading {string}', async function () {

  await this.page.getByRole('heading', { name: 'Your Claims' }).waitFor({ state: 'visible' });
  
});

Then('I should see the page title {string}', async function (expected: string) {
    
  await this.page.waitForLoadState('domcontentloaded');
  const title = await this.page.title();
  expect(title).toBe(expected);
  console.log('Page title is:', title);
  

});

When('I enter valid credentials', async function () {
  
  this.homePage = new HomePage(this.page);
  // Wait for page to load
  await this.page.waitForLoadState('domcontentloaded');
  // Wait for username field to be visible before interacting
  await this.page.getByRole('textbox', { name: 'Username' }).waitFor({ state: 'visible' });
  await this.homePage.login('bob', 'password');
 
  });

 When('I click the Sign In button', async function () {
  
   await this.page.getByRole('button', { name: 'Sign in' }).click();
        
  });


Then('I should see the following Elements', async function (dataTable) {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const expectedElements: string[] = dataTable.raw().slice(1).map((row: any[]) => row[0]); // Skip header row

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
  
  await this.page.getByRole('link', { name: 'Sign out' }).click();
});


When('I click on {string} link', async function (linkName: string) {
  switch (linkName) {
    case 'LAA-001':
      await this.page.getByRole('link', { name: 'LAA-001   – view claim' }).click();
      break;

    case 'Return to claims':
      await this.page.getByRole('link', { name: 'Return to claims' }).click();
      break;

    default:
      throw new Error(`No element found for: ${linkName}`);
  }

  // Optional: Verify navigation or element after click
  await this.page.waitForLoadState('networkidle');
});
           

 