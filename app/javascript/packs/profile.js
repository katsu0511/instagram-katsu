import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#account-show').data()
  const accountId = dataset.accountId

  axios.get(`/accounts/${accountId}/follow`)
    .then((response) => {
      const hasFollowed = response.data.hasFollowed
      if (hasFollowed) {
        $('.unfollow-btn').removeClass('hidden')
      } else {
        $('.follow-btn').removeClass('hidden')
      }
    })

    $('.follow-btn').on('click', () => {
      axios.post(`/accounts/${accountId}/follow`)
        .then((response) => {
          console.log(response)
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })

    $('.unfollow-btn').on('click', () => {
      axios.delete(`/accounts/${accountId}/follow`)
        .then((response) => {
          console.log(response)
        })
        .catch((e) => {
          window.alert('Error')
          console.log(e)
        })
    })
})
