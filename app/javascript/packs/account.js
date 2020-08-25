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
})
