import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {
  $('h1').on('click', () => {
    axios.get('/')
      .then((response) => {
        console.log(response)
      })
  })
})
