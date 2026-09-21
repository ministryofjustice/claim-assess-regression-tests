import {Component, PageOrLocator} from "./Component";
import {ListItem} from "./ListItem";

export class List extends Component {
  constructor(page: PageOrLocator, id: string) {
    const locator = page.locator(`.govuk-list#${id}`);
    super(page, locator);
  }

  listItem(text: string): ListItem {
    return new ListItem(this.locator, text);
  }
}