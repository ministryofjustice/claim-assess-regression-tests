import {Page} from "playwright";
import {expect, Locator} from "@playwright/test";

export abstract class Component {
  readonly page: PageOrLocator;
  readonly locator: Locator;

  constructor(page: PageOrLocator, locator: Locator) {
    this.page = page;
    this.locator = locator;
  }

  async isVisible() {
    return await this.locator.isVisible();
  }

  async shouldBeVisible() {
    await expect(this.locator).toBeVisible();
  }

  async shouldNotBeVisible() {
    await expect(this.locator).not.toBeVisible();
  }
}

export type PageOrLocator = Page | Locator;
