import {Component, PageOrLocator} from "./Component";

export class FileUpload extends Component {
  constructor(page: PageOrLocator) {
    const locator = page.locator('input[type="file"]');
    super(page, locator);
  }

  async select(files: string | string[]) {
    await this.locator.setInputFiles(files);
  }
}