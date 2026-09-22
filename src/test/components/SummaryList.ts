import {PageOrLocator} from "./Component";
import {SummaryListComponent} from "./SummaryListComponent";

export class SummaryList extends SummaryListComponent {
  constructor(page: PageOrLocator) {
    const locator = page.locator(".govuk-summary-list");
    super(page, locator);
  }
}