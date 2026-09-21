import {Given, Then, When} from "@cucumber/cucumber";
import {expect} from "@playwright/test";
import path from "path";
import {RadioInput} from "../components/RadioInput";
import {TextInput} from "../components/TextInput";
import {ErrorSummary} from "../components/ErrorSummary";
import {Heading} from "../components/Heading";
import {Link} from "../components/Link";
import {Button} from "../components/Button";
import {SubNavigation} from "../components/SubNavigation";
import {Navigation} from "../components/Navigation";
import {SummaryCard} from "../components/SummaryCard";
import {TaskList} from "../components/TaskList";
import {SummaryList} from "../components/SummaryList";
import {MultiSelect} from "../components/MultiSelect";
import {MultiFileUploadList} from "../components/MultiFileUploadList";
import {FileUpload} from "../components/FileUpload";
import {List} from "../components/List";

Given(
  "I log in as user {string} with password {string}",
  {timeout: 30000},
  async function (username: string, password: string) {
    const usernameInput = new TextInput(this.page, "username");
    const passwordInput = new TextInput(this.page, "password");
    const signInButton = new Button(this.page, "Sign in");

    await usernameInput.fill(username);
    await passwordInput.fill(password);
    await signInButton.click();
  },
);

Then("I should see the heading {string}", async function (expected: string) {
  const heading = new Heading(this.page);
  await heading.shouldBe(expected);
});

Then("I should see the page title {string}", async function (expected: string) {
  await this.page.waitForLoadState("domcontentloaded");
  const actual = await this.page.title();
  console.log("Page title is:", actual);
  expect(actual).toBe(expected);
});

When("I click sign out button", async function () {
  const link = new Link(this.page, "Sign out");
  await link.click();
});

When("I click on {string} link", async function (linkName: string) {
  const link = new Link(this.page, new RegExp(`^${linkName}`));
  await link.click();
});

When("I click on {string} button", async function (buttonName: string) {
  const button = new Button(this.page, buttonName);
  await button.click();
});

Then("I should see the following summary on the Claim summary page",
  async function (dataTable) {
    const summary = new List(this.page, "summary");
    await summary.isVisible();
    for (const {Key: key, Value: value} of dataTable.hashes()) {
      const listItem = summary.listItem(key);
      await listItem.containsText(value);
    }
  }
);

Then("I should see the following sub-navigation",
  async function (dataTable) {
    const subNavigation = new SubNavigation(this.page);
    await subNavigation.shouldBeVisible();
    for (const {Tab: name} of dataTable.hashes()) {
      const tab = subNavigation.item(name);
      await tab.shouldBeVisible();
    }
  }
);

Then("I should see the following navigation",
  async function (dataTable) {
    const navigation = new Navigation(this.page);
    await navigation.shouldBeVisible();
    for (const {Tab: name} of dataTable.hashes()) {
      const tab = navigation.item(name);
      await tab.shouldBeVisible();
    }
  }
);

Then("I should see the following summary cards on the Claim summary page",
  async function (dataTable) {
    for (const {Card: card, Key: key, Value: value} of dataTable.hashes()) {
      const summaryCard = new SummaryCard(this.page, card);
      await summaryCard.shouldBeVisible();
      await summaryCard.checkSummaryListRow(key, value);
    }
  }
);

When("I upload a file {string}", async function (fileName: string) {
  const summaryList = new MultiFileUploadList(this.page);
  const summaryListRows = summaryList.summaryListRows();
  const before = await summaryListRows.count();

  const filePath = path.resolve("test-data", fileName);
  const fileUpload = new FileUpload(this.page);
  await fileUpload.select(filePath);

  await expect(summaryListRows).toHaveCount(before + 1);
});

Then("I should see a {string} tag next to {string}",
  async function (tag: string, text: string) {
    const taskList = new TaskList(this.page);
    await taskList.checkTaskListItem(text, tag);
  },
);

When("I reuse a file {string}", async function (fileName: string) {
  const multiSelect = new MultiSelect(this.page);
  await multiSelect.select(fileName);
});

Then("I should see the following radio options for {string}",
  async function (question: string, dataTable) {
    const radio = new RadioInput(this.page, question);
    await radio.shouldBeVisible();

    // Verify radio options are visible
    const rows = dataTable.raw().flat();
    for (const row of rows) {
      const option = radio.option(row);
      await expect(option).toBeVisible();
    }
  },
);

When(
  'I select {string} radio button for {string}',
  async function (option: string, question: string) {
    const radio = new RadioInput(this.page, question);
    await radio.shouldBeVisible();
    await radio.fill(option);
  }
);

When("I enter {string} in the {string} field",
  async function (value: string, fieldName: string) {
    const input = new TextInput(this.page, fieldName);
    await input.fill(value);
  },
);

Then(
  'I should see {string} in the {string} field',
  async function (expectedValue: string, fieldName: string) {
    const input = new TextInput(this.page, fieldName);
    await input.shouldContain(expectedValue);
  }
);

// Verify the uploaded and delete options exists associated with the file
Then(
  "I should see the uploaded file details for {string}",
  async function (fileName: string) {
    const summaryList = new MultiFileUploadList(this.page);
    const summaryListRow = summaryList.summaryListRow(fileName);

    const deleteButton = new Button(summaryListRow, new RegExp(`Delete\\s*${fileName}`, "i"));
    await deleteButton.shouldBeVisible();
  },
);

Then("I should see the following details on the {string} page",
  async function (pageName: string, dataTable) {
    const heading = new Heading(this.page);
    await heading.shouldBe(pageName);

    const locators = dataTable.raw().flat().slice(1);

    for (const locator of locators) {
      await expect(
        this.page.locator(locator),
      ).toBeVisible();
    }
  },
);

When('I click the guidance on processing timescales link', async function () {
  const link = new Link(this.page, "guidance on processing timescales");

  const [newPage] = await Promise.all([
    this.page.context().waitForEvent('page'),
    link.click(),
  ]);

  this.newPage = newPage;
});

Then('I should see another page with the heading {string}', async function (expectedHeading: string) {
  const heading = new Heading(this.newPage);
  await heading.shouldBe(expectedHeading);
});

Then('I should see a link {string}',
  async function (linkText: string) {
    const link = new Link(this.page, linkText);
    await link.shouldBeVisible();
  }
);

Then(
  'I should see the following error messages',
  async function (dataTable) {
    const errorSummary = new ErrorSummary(this.page);

    await errorSummary.shouldBeVisible();

    const errors = dataTable.hashes();

    for (const row of errors) {
      await errorSummary.shouldContainError(row['Error message']);
    }
  }
);

Then(
  'I should not see an error summary',
  async function () {
    const errorSummary = new ErrorSummary(this.page);

    await errorSummary.shouldNotBeVisible();
  }
);

Then(
  'I should see {string} selected for {string}',
  async function (answer: string, question: string) {
    const radio = new RadioInput(this.page, question);
    await radio.shouldBeSelected(answer);
  }
);

Then(
  'I should see {string} not selected for {string}',
  async function (answer: string, question: string) {
    const radio = new RadioInput(this.page, question);
    await radio.shouldNotBeSelected(answer);
  }
);

When('I navigate back to the previous page', async function () {
  await Promise.all([
    this.page.waitForLoadState('networkidle'),
    this.page.goBack(),
  ]);
});

When(
  'I click on the {string} link for the disbursement dated {string}',
  async function (linkText: string, date: string) {
    const summaryList = new SummaryList(this.page, "disbursement-rows");
    const summaryListRow = summaryList.summaryListRow(date);
    await summaryListRow.isVisible();
    const link = new Link(summaryListRow, new RegExp(`^${linkText}`, 'i'));
    await link.click();
  }
);