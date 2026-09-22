import {expect} from "@playwright/test";
import {Component, PageOrLocator} from "./Component";

export class RadioInput extends Component {

  constructor(page: PageOrLocator, question: string) {
    const locator = page.getByRole('group', {
      name: new RegExp(question, 'i'),
    })
    super(page, locator);
  }

  option(value: string) {
    return this.locator.getByLabel(value);
  }

  async shouldBeSelected(value: string) {
    await expect(this.option(value)).toBeChecked();
  }

  async shouldNotBeSelected(value: string) {
    await expect(this.option(value)).not.toBeChecked();
  }

  async fill(value: string) {
    const radio = this.option(value);
    await radio.check();
    await expect(radio).toBeChecked();
  }
}