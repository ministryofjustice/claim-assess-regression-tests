import {Component, PageOrLocator} from "./Component";
import {expect} from "@playwright/test";

export class Table extends Component {
  constructor(page: PageOrLocator, name: string) {
    const locator = page.getByRole("table", {name});
    super(page, locator);
  }

  row(name: string) {
    return this.locator
      .getByRole("rowheader", { name, exact: true })
      .locator(".."); // get the parent element
  }

  async checkTableRow(rowData: Record<string, string>) {
    const [key, ...values] = Object.values(rowData);
    const row = this.row(key);

    const cells = row.getByRole("cell");

    for (const [index, expectedValue] of values.entries()) {
      await expect(cells.nth(index)).toHaveText(expectedValue);
    }
  }
}