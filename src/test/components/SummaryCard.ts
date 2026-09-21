import {PageOrLocator} from "./Component";
import {SummaryListComponent} from "./SummaryListComponent";

export class SummaryCard extends SummaryListComponent {
  constructor(page: PageOrLocator, heading: string) {
    const locator = page.locator(".govuk-summary-card").filter({
      has: page.getByRole("heading", { name: heading, level: 2 }),
    });
    super(page, locator);
  }
}