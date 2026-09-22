import {Component, PageOrLocator} from "./Component";

export class MultiSelect extends Component {
  constructor(page: PageOrLocator) {
    const locator = page.locator('.govuk-table[data-module="moj-multi-select"]');
    super(page, locator);
  }

  row(name: string) {
    return this.locator.getByRole("row", {
      name: `Select ${name}`,
    });
  }

  async select(name: string) {
    await this.row(name).locator("label").click();
  }
}