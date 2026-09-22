import {Component, PageOrLocator} from "./Component";
import {expect} from "@playwright/test";

export class ErrorSummary extends Component {
  constructor(page: PageOrLocator) {
    const locator = page.locator(".govuk-error-summary");
    super(page, locator);
  }

  async shouldContainError(error: string) {
    await expect(this.locator).toContainText(error);
  }
}