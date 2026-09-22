import {Component, PageOrLocator} from "./Component";

export class Alert extends Component {
  constructor(page: PageOrLocator, heading: string) {
    const locator = page.getByRole("region").filter({
      has: page.getByRole("heading", {
        name: heading,
      }),
    });

    super(page, locator);
  }
}