import { Controller } from "stimulus"
import {
  presetsMapping,
  applyPresetOnImage,
} from "https://cdn.skypack.dev/instagram-filters"

export default class extends Controller {
  static values = { name: String, applied: Boolean }
  static targets = ["thumbnail"]

  connect() {
    // Apply the preset if the image was already loaded when this controller was connected.
    // Otherwise the preset is applied in the image load event
    if (this.thumbnailTarget.complete) this.applyPreset()
  }

  applyPreset = async () => {
    if (this.appliedValue) return

    const presetName = this.nameValue
    const preset = presetsMapping[presetName]

    const blob = await applyPresetOnImage(this.thumbnailTarget, preset())
    this.thumbnailTarget.src = window.URL.createObjectURL(blob)

    this.appliedValue = true
  }
}
