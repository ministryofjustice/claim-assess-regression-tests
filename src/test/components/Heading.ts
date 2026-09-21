import {Component, PageOrLocator} from "./Component";
import {expect} from "@playwright/test";

export class Heading extends Component {

  constructor(page: PageOrLocator) {
    const locator = page.locator('h1');
    super(page, locator);
  }

  async shouldBe(value: string) {
    const actual = await this.locator.textContent();

    if (actual == null) {
      throw new Error("No h1 found");
    }

    console.log("Page heading is:", actual);

    expect(actual.trim()).toBe(value);
  }
}