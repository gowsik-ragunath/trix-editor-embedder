
import { Controller } from "stimulus"
import Trix from "trix"

export default class extends Controller {
  static targets = [ "editor", "toolbar" ]

  connect() {
    if(this.editorTarget && this.toolbarTarget) {
      let editor = this.editorTarget;
      let toolbar = this.toolbarTarget;
      let ttools  = toolbar.querySelector(".trix-button-group--text-tools");
      let dialog = toolbar.querySelector(".trix-dialogs");
      let trixId  = editor.trixId;


      let dialogContent = `
        <div class="trix-dialog trix-dialog--attach" data-trix-dialog="embed" data-trix-dialog-attribute="embed">
          <div class="trix-dialog__attach-fields">
            <input type="text" class="trix-input trix-input--dialog">
            <div class="trix-button-group">
              <input type="button" class="trix-button trix-button--dialog"
                data-action="click->trix-editor#embedIframe"
                value="Embed" data-trix-method="removeAttribute">
              <input type="button" class="trix-button trix-button--dialog" value="Cancel" data-trix-method="removeAttribute">
            </div>
          </div>
        </div>
      `;
      // add dialog
      if(!dialog) {
        toolbar.insertAdjacentHTML("beforeend", "<div class='trix-dialogs' data-trix-dialogs></div>");
        dialog = toolbar.querySelector(".trix-dialogs");
        dialog.insertAdjacentHTML("beforeend", dialogContent);
      }
      else {
        dialog.insertAdjacentHTML("beforeend", dialogContent);
      }
    }
  }

  embedIframe(event) {
    let targetElement = event.target;
    let inputText = targetElement.parentElement.parentElement.childNodes[1];
    let url = inputText.value;
    let request_path = document.getElementById("embed_url").value;
    if(url != "undefinded" && url != null) {
      let trix_editor = this.editorTarget;

      let data = { "url": url };
      fetch(request_path, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        const attachment = new Trix.Attachment({
          content: data["url"],
          sgid: data["sgid"],
        });
        trix_editor.editor.insertAttachment(attachment);
        trix_editor.editor.insertLineBreak();
      })
      .catch((error) => {
        console.error('Error:', error);
      });
    }
  }
}
