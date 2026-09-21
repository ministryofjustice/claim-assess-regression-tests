import {Component, PageOrLocator} from "./Component";
import {Locator} from "@playwright/test";

export class Link extends Component {
  constructor(page: PageOrLocator | Locator, name: string | RegExp) {
    const locator = page.getByRole("link", { name });
    super(page, locator);
  }

  async click() {
    await this.locator.click();
  }
}