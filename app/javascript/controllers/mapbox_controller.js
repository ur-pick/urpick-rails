import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


export default class extends Controller {
  static values = {
    apiKey: String,
    cityCoords: [Number],
    currentLocationId: String 
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: this.cityCoordsValue, // starting position [lng, lat]
      zoom: 13
    })
    this.handleGeocoder(this.map);
    this.handleLocationClick(this.map);
  }


  handleGeocoder(map) {
    map.on('load', () => {
      const cityCoords = [...this.cityCoordsValue]
      const boundingBox = [cityCoords[0] - 1, cityCoords[1] -1, cityCoords[0] + 1, cityCoords[1] + 1]
      const geocoder = new MapboxGeocoder({
        // Initialize the geocoder
        accessToken: mapboxgl.accessToken, 
        mapboxgl: mapboxgl,
        marker: false,
        zoom: 13, 
        placeholder: 'Enter an address or place name', 
        bbox: boundingBox,
      });
      geocoder.on('result', function(ev) {
        const res  = ev.result;
        const popup = new mapboxgl.Popup().setHTML(`
        <article id="fs${res.properties.foursquare}">
          <h4>${res.text}</h4>
          <p>${res.properties.address}</p>
          <a href="/places/${res.properties.foursquare}">See Details</a>
          <button>Click This One</button>
        </article>
        `)
        new mapboxgl.Marker()
          .setLngLat(ev.result.center)
          .setPopup(popup)
          .addTo(map)
        
        const resultId = document.querySelector(`#fs${res.properties.foursquare}`);
        console.log({resultId});
      });
      map.addControl(geocoder, 'top-left'); 
    });
  }
  handleLocationClick(map) {
    map.on('click', e => {
      console.log({e})
    })
    
  }

}