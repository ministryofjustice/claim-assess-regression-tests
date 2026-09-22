import {PageOrLocator} from "./Component";
import {SummaryListComponent} from "./SummaryListComponent";

export class MultiFileUploadList extends SummaryListComponent {
  constructor(page: PageOrLocator) {
    const locator = page.locator(".govuk-summary-list.moj-multi-file-upload__list");
    super(page, locator);
  }

  summaryListRowsWithUploadedTags() {
    return this.summaryListRows().locator(".govuk-tag", { hasText: "Uploaded" });
  }
}