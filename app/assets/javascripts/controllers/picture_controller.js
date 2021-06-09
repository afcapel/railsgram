import { Controller } from "stimulus"
import {
  presetsMapping,
  applyPresetOnImage,
} from "https://cdn.skypack.dev/instagram-filters"

export default class extends Controller {
  static targets = ["preview", "original", "field"]

  choosePreset = async (event) => {
    const presetElm = event.target.closest("[data-preset-name-value]")
    const presetName = presetElm.getAttribute("data-preset-name-value")
    const preset = presetsMapping[presetName]

    const blob = await applyPresetOnImage(this.originalTarget, preset())
    this.previewTarget.src = window.URL.createObjectURL(blob)

    const reader = new FileReader()
    reader.readAsDataURL(blob)

    reader.onloadend = () => {
      const base64data = reader.result
      this.fieldTarget.value = base64data
    }
  }
}
