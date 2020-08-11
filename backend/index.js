const express = require('express')
const { getTrivia } = require('./trivia')
const app = express()

app.get('/trivia',async (req,res) => {
    try {
        const d = new Date()
        const data = await getTrivia(d.getDate(),d.getMonth()+1)
        res.send(`${data}`)
    } catch (error) {
        res.send("Error" + error)
    }
})

app.listen(process.env.BACKEND_PORT)