const express = require('express');
const router = express.Router();
const genres = require('../controllers/genreController');

// Genre route to get all genres
router.get('/get', async (req, res) => {

    // Call controller method for genres data fetch
    let data = await genres.getGenres();
    return res.status(200).json(data);
});

module.exports = router;