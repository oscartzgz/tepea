import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="news"
export default class extends Controller {
  static targets = [ "nextPage" ]
  
  connect() {
    document.body.onscroll = () => {
      const container = document.getElementsByTagName('html')[0];

      // If reach bottom limit load more clicking on next page link
      if (Math.abs(container.scrollHeight - container.clientHeight - container.scrollTop) < 1) {
        this.loadMoreNews()
      }
    }
  }

  loadMoreNews() {
    if(this.hasNextPageTarget) {
      this.nextPageTarget.click()
    }
  }
}
