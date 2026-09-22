import {Component, PageOrLocator} from "./Component";
import {expect} from "@playwright/test";

export class TaskList extends Component {
  constructor(page: PageOrLocator) {
    const locator = page.locator(".govuk-task-list");
    super(page, locator);
  }

  item(name: string) {
    return this.locator.locator(".govuk-task-list__item", {
      hasText: name,
    })
  }

  async checkTaskListItem(name: string, status: string) {
    const item = this.item(name);
    const itemStatus = item.locator(".govuk-task-list__status");
    await expect(itemStatus).toHaveText(status);
  }
}