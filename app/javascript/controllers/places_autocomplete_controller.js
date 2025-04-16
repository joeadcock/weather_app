import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Dynamically load Google Places API
    // https://developers.google.com/maps/documentation/javascript/load-maps-js-api#migrate-to-dynamic
    // https://developers.google.com/maps/documentation/places/web-service/place-autocomplete
    google.maps.importLibrary('places').then(places => {
      const placeAutocomplete = new places.PlaceAutocompleteElement()
      this.element.appendChild(placeAutocomplete)
      placeAutocomplete.addEventListener('gmp-select', this.onLocationSelect)
    })
  }

  async onLocationSelect({ placePrediction}) {
    // Retrieve the postalCode/ZIP and country from the location selected
    const place = placePrediction.toPlace()

    await place.fetchFields({ fields: ['addressComponents'] })

    const addressComponents = place.toJSON().addressComponents
    const postalCode = addressComponents.find(c => c.types.includes("postal_code"))?.shortText
    const country = addressComponents.find(c => c.types.includes("country"))?.shortText

    // Show an error if the location is missing a ZIP
    if (!postalCode) {
      alert("Location must contain a ZIP code")
    }

    // Redirect to the zip-specific weather details
    const url = new URL(window.location.href)

    country ? url.searchParams.set("country", country) : url.searchParams.delete("country")
    postalCode ? url.searchParams.set("zip", postalCode) : url.searchParams.delete("zip")

    window.location.href = url
  }
}
