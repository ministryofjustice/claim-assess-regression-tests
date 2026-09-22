import {Component, PageOrLocator} from "./Component";
import {expect} from "@playwright/test";

export class ListItem extends Component {
  constructor(page: PageOrLocator, text: string) {
    const locator = page.locator("li").filter({
      hasText: text,
    });
    super(page, locator);
  }

  async containsText(text: string) {
    await expect(this.locator).toContainText(text);
  }
}