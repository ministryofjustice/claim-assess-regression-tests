import {Component, PageOrLocator} from "./Component";

export class Button extends Component {
  constructor(page: PageOrLocator, name: string | RegExp) {
    const locator = page.getByRole("button", { name });
    super(page, locator);
  }

  async click() {
    await this.locator.click();
  }
}