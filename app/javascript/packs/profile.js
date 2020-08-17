import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  $('h1').on('click', () => {
    axios.get('/')
      .then((response) => {
        console.log(response)
      })
  })
})
