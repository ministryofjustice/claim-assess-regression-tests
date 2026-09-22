import {Component} from "./Component";
import {expect} from "@playwright/test";

export abstract class SummaryListComponent extends Component {
  get summaryListRows() {
    return this.locator.locator(".govuk-summary-list__row");
  }

  summaryListRow(key: string) {
    return this.summaryListRows.filter({
      has: this.page.locator(".govuk-summary-list__key", {
        hasText: key,
      }),
    });
  }

  async checkSummaryListRow(key: string, value: string) {
    const row = this.summaryListRow(key);
    await expect(row).toContainText(value);
  }
}