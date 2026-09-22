import {Component, PageOrLocator} from "./Component";
import {Link} from "./Link";

export class Navigation extends Component {
  constructor(page: PageOrLocator) {
    const locator = page.getByRole("navigation", {name: "Menu"});
    super(page, locator);
  }

  item(name: string): Link {
    return new Link(this.locator, name);
  }
}