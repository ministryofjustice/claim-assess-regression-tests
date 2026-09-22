import {DataTable, Given, Then, When} from "@cucumber/cucumber";
import {expect} from "@playwright/test";
import path from "path";
import {RadioInput} from "../components/RadioInput";
import {TextInput} from "../components/TextInput";
import {ErrorSummary} from "../components/ErrorSummary";
import {Heading} from "../components/Heading";
import {Link, SignOutLink} from "../components/Link";
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
import {Table} from "../components/Table";
import {Alert} from "../components/Alert";

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
  expect(actual).toBe(expected);
});

When("I click sign out button", async function () {
  const link = new SignOutLink(this.page);
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

Then("I should see the following {string} list",
  async function (id: string, dataTable: DataTable) {
    const list = new List(this.page, id);
    await list.isVisible();
    for (const {Key: key, Value: value} of dataTable.hashes()) {
      const listItem = list.listItem(key);
      await listItem.containsText(value);
    }
  }
);

Then("I should see the following {string} table",
  async function (tableName: string, dataTable: DataTable) {
    const table = new Table(this.page, tableName);
    await table.shouldBeVisible();
    for (const row of dataTable.hashes()) {
      await table.checkTableRow(row);
    }
  }
);

Then("I should see the following sub-navigation",
  async function (dataTable: DataTable) {
    const subNavigation = new SubNavigation(this.page);
    await subNavigation.shouldBeVisible();
    for (const {Tab: name} of dataTable.hashes()) {
      const tab = subNavigation.item(name);
      await tab.shouldBeVisible();
    }
  }
);

Then("I should see the following navigation",
  async function (dataTable: DataTable) {
    const navigation = new Navigation(this.page);
    await navigation.shouldBeVisible();
    for (const {Tab: name} of dataTable.hashes()) {
      const tab = navigation.item(name);
      await tab.shouldBeVisible();
    }
  }
);

Then("I should see the following rows in the {string} summary card",
  async function (summaryCardName: string, dataTable: DataTable) {
    const summaryCard = new SummaryCard(this.page, summaryCardName);
    for (const {Key: key, Value: value} of dataTable.hashes()) {
      await summaryCard.shouldBeVisible();
      await summaryCard.checkSummaryListRow(key, value);
    }
  }
);

Then("I should see the following rows in the {string} {string} summary card",
  async function (nth: string, summaryCardName: string, dataTable: DataTable) {
    const index = Number(nth.replace(/\D+$/, ""));
    const summaryCard = new SummaryCard(this.page, summaryCardName, index);
    for (const {Key: key, Value: value} of dataTable.hashes()) {
      await summaryCard.shouldBeVisible();
      await summaryCard.checkSummaryListRow(key, value);
    }
  }
);

When("I upload a file {string}", async function (fileName: string) {
  const summaryList = new MultiFileUploadList(this.page);
  const summaryListRows = summaryList.summaryListRowsWithUploadedTags();
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
  async function (question: string, dataTable: DataTable) {
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

When('I click the {string} link which opens in a new tab', async function (name: string) {
  const link = new Link(this.page, name);

  const [newPage] = await Promise.all([
    this.page.context().waitForEvent('page'),
    link.click(),
  ]);

  this.newPage = newPage;
});

Then('I should see another page with the heading {string}', async function (expectedHeading: string) {
  const heading = new Heading(this.newPage);
  await heading.shouldBe(expectedHeading);
  await this.close(this.newPage);
});

Then('I should see a link {string}',
  async function (linkText: string) {
    const link = new Link(this.page, linkText);
    await link.shouldBeVisible();
  }
);

Then(
  'I should see the following error messages',
  async function (dataTable: DataTable) {
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
  'I click on the {string} link for {string}',
  async function (linkText: string, date: string) {
    const summaryList = new SummaryList(this.page);
    const summaryListRow = summaryList.summaryListRow(date);
    await summaryListRow.isVisible();
    const link = new Link(summaryListRow, new RegExp(`^${linkText}`, 'i'));
    await link.click();
  }
);

Then(
  'I should see an alert message {string}',
  async function (expectedMessage: string) {
    const alert = new Alert(this.page, expectedMessage);
    await alert.shouldBeVisible();
  }
);
