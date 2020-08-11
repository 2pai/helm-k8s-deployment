const express = require('express')
const axios = require('axios')
const app = express()

app.set('view engine', 'pug')
app.set('views', './views')
app.get('/', async (req,res) => {
    const trivia = await axios.get(`http://${process.env.BACKEND_URI}/trivia`)
    res.render('main', {data: trivia.data})
})
app.listen(process.env.FRONTEND_PORT)