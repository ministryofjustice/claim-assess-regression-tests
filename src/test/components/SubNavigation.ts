import {Component, PageOrLocator} from "./Component";
import {Link} from "./Link";

export class SubNavigation extends Component {
  constructor(page: PageOrLocator) {
    const locator = page.getByRole("navigation", {name: "Sub navigation"});
    super(page, locator);
  }

  item(name: string): Link {
    return new Link(this.locator, name);
  }
}