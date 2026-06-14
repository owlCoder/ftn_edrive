import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const FilterSidebar = ({ setSelectedGenres, selectedGenres, maxPrice, range, queryGenre }) => {
  const [priceRange, setLocalPriceRange] = useState([0, maxPrice]);
  const [genres, setGenres] = useState([]);
  const navigate = useNavigate();

  const handlePriceChange = (newRange) => {
    range(newRange);
    setLocalPriceRange(newRange);
  };

  const handleGenreChange = (genre) => {
    setSelectedGenres((prevGenres) =>
      prevGenres.includes(genre.id)
        ? prevGenres.filter((selectedGenre) => selectedGenre !== genre.id)
        : [...prevGenres, genre.id]
    );
  };

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const response = await axios.get(
          global.APIEndpoint + '/api/genre/get',
          {
            headers: {
              'Content-Type': 'application/json',
            },
          }
        );

        if (response.status === 200) {
          setGenres(response.data.payload);

          if (queryGenre && queryGenre !== "") {
            var genrestr = decodeURIComponent(queryGenre);
            const matchingGenre = response.data.payload.find(genre => genre.name === genrestr);
            if (matchingGenre) {
              setSelectedGenres((prevGenres) =>
                [...prevGenres, matchingGenre.id]
              );
            }
          }
        }
      } catch (error) {
        navigate('/403');
      }
    };

    fetchGenres();
  }, [navigate, queryGenre, setSelectedGenres]);


  return (
    <div className="sticky top-20 h-full max-h-screen overflow-y-auto bg-gray-200 p-4 hidden lg:flex flex-col w-1/4 dark:bg-slate-900 divide-y divide-solid rounded-2xl ml-4">
      <h2 className="text-xl font-bold mb-4">Filters</h2>

      {/* Price Range Slider */}
      <div className="mb-4">
        <label className="block text-sm font-medium dark:text-gray-300 pt-2">
          Price Range
        </label>
        <div className="mt-1">
          <input
            type="range"
            min={0}
            max={maxPrice}
            step={1}
            value={priceRange[1]}
            onChange={(e) =>
              handlePriceChange([priceRange[0], e.target.value])
            }
            className="w-full"
          />
          <div className="flex justify-between">
            <span>{priceRange[0]}</span>
            <span>{priceRange[1]}</span>
          </div>
        </div>
      </div>

      {/* Genre Checkboxes */}
      <div>
        <label className="block text-sm font-medium dark:text-gray-300 pt-2">
          Genres
        </label>
        <div className="mt-2 space-y-2">
          {genres.map((genre) => (
            <div key={genre.id} className="flex items-center">
              <input
                type="checkbox"
                id={genre.id}
                checked={selectedGenres.includes(genre.id)}
                onChange={() => handleGenreChange(genre)}
                className="mr-2"
              />
              <label htmlFor={genre.id} className="text-sm">
                {genre.name}
              </label>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default FilterSidebar;
