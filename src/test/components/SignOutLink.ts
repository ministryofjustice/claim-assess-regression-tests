import {Link} from "./Link";
import {PageOrLocator} from "./Component";

export class SignOutLink extends Link {
  constructor(page: PageOrLocator) {
    super(page, "Sign out");
  }
}