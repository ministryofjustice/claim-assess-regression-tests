import {expect} from "@playwright/test";
import {Component, PageOrLocator} from "./Component";

export class TextInput extends Component {

  constructor(page: PageOrLocator, name: string) {
    const locator = page.getByRole("textbox", { name });
    super(page, locator);
  }

  async shouldContain(value: string) {
    await expect(this.locator).toHaveValue(value);
  }

  async fill(value: string) {
    await this.locator.fill(value);
  }
}