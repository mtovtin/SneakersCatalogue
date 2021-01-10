import Rails from "@rails/ujs"
export function pagination_js(button) {
  Rails.ajax({
    type: "GET",
    url: "/set_page",
    data: "page="+button.dataset.page,
    success: function(response){
      console.log("succses response")
    },
    error: function(response){
      console.log("error")
    }
  })
}