import Rails from "@rails/ujs"
export function pagination_js(button) {
 var avialability_selector=document.getElementById("avialability")
  Rails.ajax({
    type: "GET",
    url: window.location.href,
    data: "page="+button.dataset.page+"&avialability="+avialability_selector.value,
    success: function(response){
      console.log("succses response")
    },
    error: function(response){
      console.log("error")
    }
  })
}

export function change_avialability(selector) {
  Rails.ajax({
    type: "GET",
    url: window.location.href,
    data: "avialability="+selector.value,
    success: function(response){
      console.log("succses response")
    },
    error: function(response){
      console.log("error")
    }
  })
}
export function search(text) {
  console.log(window.location.href.split("/"))
  Rails.ajax({
    type: "GET",
    url: window.location.href,
    data: "search="+text,
    success: function(response){
      console.log("succses response")
    },
    error: function(response){
      console.log("error")
    }
  })
}