const axios = require('axios')

const getTrivia = async (day,month) => {
    try {
        const data = await axios.get(`http://numbersapi.com/${month}/${day}/date`)
        return data.data
    } catch (error) {
        return Error("Error getting trivia")
    }
}

module.exports = {
    getTrivia
}