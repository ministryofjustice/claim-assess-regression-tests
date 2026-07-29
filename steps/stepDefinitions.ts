import { Given, Then, When } from "@cucumber/cucumber";
import { HomePage } from "../pages/HomePage";
import { expect } from "@playwright/test";
import { LoginPage } from "../pages/LoginPage";
import path from "path";

Given(
  "I log in to Claim as user {string} with password {string}",
  { timeout: 30000 },
  async function (username: string, password: string) {
    const claimUrl = process.env.CLAIM_BASE_URL || "http://localhost:3000";

    this.homePage = new HomePage(this.page);
    await this.homePage.goto(claimUrl);

    const loginPage = new LoginPage(this.page);
    await loginPage.login(username, password);
  },
);

Given(
  "I log in to Assess as user {string} with password {string}",
  { timeout: 30000 },
  async function (username: string, password: string) {
    const assessUrl = process.env.ASSESS_BASE_URL || "http://localhost:3001";

    this.homePage = new HomePage(this.page);
    await this.homePage.goto(assessUrl);

    const loginPage = new LoginPage(this.page);
    await loginPage.login(username, password);
  },
);

Then("I should see the heading {string}", async function (expected: string) {
  const heading = await this.page.locator("h1").textContent();

  console.log("Page heading is:", heading);

  expect(heading?.trim()).toBe(expected);
});

Then(
  "I should see the heading on the page {string}",
  async function (expected: string) {
    await expect(this.page.getByRole("heading", { level: 1 })).toHaveText(
      new RegExp(expected, "i"),
    );
  },
);

Then("I should see the page title {string}", async function (expected: string) {
  await this.page.waitForLoadState("domcontentloaded");
  const title = await this.page.title();

  console.log("Page title is:", title);

  expect(title).toBe(expected);
});

When("I enter valid credentials", async function () {
  this.homePage = new HomePage(this.page);

  await this.page.waitForLoadState("domcontentloaded");

  await this.page
    .getByRole("textbox", { name: "Username" })
    .waitFor({ state: "visible" });

  await this.homePage.login("bob", "password");
});

When("I click the Sign In button", async function () {
  await this.page.getByRole("button", { name: "Sign in" }).click();
});

Then("I should see the following Elements", async function (dataTable) {
  const expectedElements: string[] = dataTable
    .raw()
    .slice(1)
    .map((row: unknown[]) => row[0]);

  for (const text of expectedElements) {
    const locator = this.page.locator(`text=${text}`);

    await expect(locator).toBeVisible({ timeout: 5000 });

    console.log(expectedElements);
  }
});

When("I click the Start button", async function () {
  return "pending";
});

When("I click sign out button", async function () {
  await this.page.getByRole("link", { name: "Sign out" }).click();
});

When("I click on {string} link", async function (linkName: string) {
  await this.page
    .getByRole("link", { name: new RegExp(`^${linkName}`) })
    .click();
});

When("I click on {string} button", async function (button: string) {
  await this.page.getByRole("button", { name: button }).click();
});

Then(
  "I should see the following Elements on Claim Summary page",
  async function (dataTable) {
    const page = this.page;

    const elements = dataTable.hashes();

    for (const row of elements) {
      const elementName = row["Elements"];

      switch (elementName) {
        case "In progress":
          await expect(page.getByText("In progress")).toBeVisible();
          break;

        case "Total claim amount":
          await expect(page.getByText("Total claim amount:")).toBeVisible();
          break;

        case "Date received":
          await expect(page.getByText("Date received")).toBeVisible();
          break;

        case "Case reference number":
          await expect(page.getByText("Case reference number")).toBeVisible();
          break;

        case "LAA reference number":
          await expect(page.getByText("LAA reference number")).toBeVisible();
          break;

        case "Assigned to":
          await expect(page.getByText("Assigned to")).toBeVisible();
          break;

        case "Provider risk":
          await expect(page.getByText("Provider risk:")).toBeVisible();
          break;

        case "Action button":
          await expect(
            page.getByRole("button", { name: /action/i }),
          ).toBeVisible();
          break;

        case "Claim time standard":
          await expect(page.getByText("Claim time standard:")).toBeVisible();
          break;

        case "Remove from your list":
          await expect(
            page.getByRole("button", { name: "Remove from your list" }),
          ).toBeVisible();
          break;

        default:
          throw new Error(`Unknown element: ${elementName}`);
      }
    }
  },
);

Then("I should see the following Elements on Claim summary tabbed box",
  async function (dataTable) {
    const page = this.page;

    const elements = dataTable.hashes();

    for (const row of elements) {
      const elementName = row["Elements"];

      switch (elementName) {
        case "Claim summary":
          await expect(page.getByText("Claim summary")).toBeVisible();
          break;

        case "Review and assess":
          await expect(
            page
              .getByLabel("Sub navigation")
              .getByRole("link", { name: "Review and assess" }),
          ).toBeVisible();
          break;

        case "Claim History":
          await expect(
            page
              .getByLabel("Sub navigation")
              .getByRole("link", { name: "Claim history" }),
          ).toBeVisible();
          break;

        case "All evidence":
          await expect(
            page
              .getByLabel("Sub navigation")
              .getByRole("link", { name: "All evidence" }),
          ).toBeVisible();
          break;

        case "Case":
          await expect(
            page.getByRole("heading", { name: "Case" }),
          ).toBeVisible();
          break;

        case "Certificate scope":
          await expect(
            page.getByRole("heading", { name: "Certificate scope" }),
          ).toBeVisible();
          break;

        case "Proceedings":
          await expect(
            page.getByRole("heading", { name: "Proceedings" }),
          ).toBeVisible();
          break;

        case "Outcome":
          await expect(page.getByText("Outcome")).toBeVisible();
          break;

        case "Level of service":
          await expect(page.getByText("Level of service")).toBeVisible();
          break;

        case "Supervision order":
          await expect(page.getByText("Supervision order")).toBeVisible();
          break;

        case "Request update from provider":
          await expect(
            page.getByText("Request update from provider"),
          ).toBeVisible();
          break;

        case "Make a decision":
          await expect(page.getByText("Make a decision")).toBeVisible();
          break;

        default:
          throw new Error(`Unknown element: ${elementName}`);
      }
    }
  },
);

When("I upload a file {string}", async function (fileName: string) {
  const uploadedTags = this.page.locator(".govuk-tag", { hasText: "Uploaded" });
  const before = await uploadedTags.count();

  const filePath = path.resolve("test-data", fileName);

  await this.page.locator('input[type="file"]').setInputFiles(filePath);

  await expect(uploadedTags).toHaveCount(before + 1);
});

When("I click on {string} radio button", async function (radioButton: string) {
  await this.page.getByRole("radio", { name: radioButton }).check();
});

Then("I should see a {string} tag next to {string}",
  async function (tag: string, text: string) {
    const item = this.page.locator(".govuk-task-list__item", {
      hasText: text,
    });

    await expect(item.locator(".govuk-task-list__status")).toHaveText(tag);
  },
);

When("I reuse a file {string}", async function (fileName: string) {
  const row = this.page
    .getByRole("row", {
      name: `Select ${fileName}`,
    })
    .locator("label");

  await row.click();
});

Then("I should see the following radio options for {string}",
  async function (question: string, dataTable) {
    const options = dataTable.raw().flat();

    // Verify question is visible
    await expect(this.page.getByText(question, { exact: false })).toBeVisible();

    // Verify radio options are visible
    for (const option of options) {
      await expect(
        this.page.getByRole("radio", { name: option }),
      ).toBeVisible();
    }
  },
);

When(
  'I select {string} radio button for {string}',
  async function (option: string, question: string) {
    const group = this.page.getByRole('group', {
      name: new RegExp(question, 'i'),
    });

    await expect(group).toBeVisible();

    const radio = group.getByLabel(option);

    await radio.check();
    await expect(radio).toBeChecked();

    // Store answer for later validation
    this.selectedAnswers ??= {};
    this.selectedAnswers[question] = option;
  }
);

When(
  'I check {string} radio button for {string}',
  async function (radioButton: string, question: string) {
    const radio = this.page
      .getByRole('group', { name: new RegExp(question, 'i') })
      .getByLabel(radioButton);

    await expect(radio).toBeVisible();
    await radio.check();

    // Store answer for later validation
    this.selectedAnswers ??= {};
    this.selectedAnswers[question] = radioButton;
  }
);

When("I enter {string} in the {string} field",
  async function (value: string, fieldName: string) {
    await this.page.getByRole("textbox", { name: fieldName }).fill(value);
  },
);

// Verify the uploaded and delete options exists associated with the file
Then(
  "I should see the uploaded file details for {string}",
  async function (fileName: string) {
    await expect(
      this.page.getByRole("link", { name: fileName }).first(),
    ).toBeVisible();

    await expect(
      this.page
        .getByRole("button", {
          name: new RegExp(`Delete\\s*${fileName}`, "i"),
        })
        .first(),
    ).toBeVisible();
  },
);

Then("I should see the following details on the {string} page",
  async function (pageName: string, dataTable) {
    await expect(
      this.page.getByRole("heading", { name: pageName }),
    ).toBeVisible();

    const elements = dataTable.raw().flat().slice(1);

    for (const element of elements) {
      switch (element) {
        case "Assessment summary":
          await expect(
            this.page.getByRole("table", {
              name: "Assessment summary",
            }),
          ).toBeVisible();
          break;

        case "Check your answers":
          await expect(this.page.getByText("Check your answers")).toBeVisible();
          break;

        case "POA CPGFS profit cost bill":
          await expect(
            this.page.getByRole("heading", {
              name: /POA CPGFS profit cost bill/i})).toBeVisible();
          break;

        case "Date 20 December 2023":
          await expect(
            this.page.locator("#profit-cost-bill-line"),
          ).toContainText("Date");
          break;

        case "Evidence":
          await expect(this.page.getByText(element, { exact: false }).first()).toBeVisible();
          break;

        case "Expert cost bill line":
          await expect(
            this.page.getByText("Expert cost bill line").first(),
          ).toBeVisible();

          await expect(
            this.page.getByText("Expert cost bill line").nth(1),
          ).toBeVisible();
          break;

        case "Submit":
          await expect(
            this.page.getByRole("button", { name: "Submit" }),
          ).toBeVisible();
          break;

        default:
          throw new Error(`Unknown element: ${element}`);
      }
    }
  },
);

When('I click the guidance on processing timescales link', async function () {
  const [newPage] = await Promise.all([
    this.page.context().waitForEvent('page'),
    this.page.getByRole('link', { name: /guidance on processing timescales/i }).click(),
  ]);

  this.newPage = newPage;
});

Then('I should see another page with the heading {string}',
async function (expectedHeading: string) {
    await this.newPage.waitForLoadState();

    await expect(
      this.newPage.getByRole('heading', {
        name: new RegExp(expectedHeading, 'i'),
      })
    ).toBeVisible();

    await this.page.bringToFront();
  }
);

Then('I should see a link {string}',
  async function (linkText: string) {
    await expect(this.page.getByRole('link', { name: linkText })).toBeVisible();
  }
);

Then(
  'I should see the following error messages',
  async function (dataTable) {
    const errorSummary = this.page.locator('.govuk-error-summary');

    await expect(errorSummary).toBeVisible();

    const errors = dataTable.hashes();

    for (const row of errors) {
      await expect(errorSummary).toContainText(
        row['Error message']
      );
    }
  }
);

Then(
  'I should see {string} selected for {string}',
  async function (answer: string, question: string) {
    const group = this.page.getByRole('group', {
      name: new RegExp(question, 'i'),
    });

    await expect(
      group.getByLabel(answer)
    ).toBeChecked();
  }
);
