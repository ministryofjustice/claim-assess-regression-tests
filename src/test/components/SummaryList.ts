import {PageOrLocator} from "./Component";
import {SummaryListComponent} from "./SummaryListComponent";

export class SummaryList extends SummaryListComponent {
  constructor(page: PageOrLocator, id: string) {
    const locator = page.locator(`.govuk-summary-list#${id}`);
    super(page, locator);
  }
}