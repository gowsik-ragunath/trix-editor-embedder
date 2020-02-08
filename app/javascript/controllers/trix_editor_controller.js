
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "editor", "toolbar" ]

  connect() {
    let editor = this.editorTarget;
    let toolbar = this.toolbarTarget;
    console.log(toolbar);
  }
}
