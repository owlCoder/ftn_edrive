import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import Item from '../product/Item';
import { Popup } from '../main/Popup';
import Navbar from '../navigation/Navbar';
import LoadingSpinner from '../loading/loading';
import FilterSidebar from './FilterSidebar';
import SearchBar from './SearchBar';
import { useLocation } from 'react-router-dom';

function Store() {
  const [open, setOpen] = useState(false);
  const [data, setData] = useState([]);
  const [popupData, setPopupData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [selectedGenres, setSelectedGenres] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [highestPrice, setHighestPrice] = useState(0);
  const [priceRange, setPriceRange] = useState([0, 0]);

  // search query
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const queryValue = queryParams.get('query');
  const genreValue = queryParams.get('genre');

  const navigate = useNavigate();

  const openPopup = (data) => {
    setOpen(true);
    setPopupData(data);
  };  

  useEffect(() => {
    setLoading(true);

    const fetchData = async () => {
      try {
        const response = await axios.get(global.APIEndpoint + '/api/product/get', {
          headers: {
            'Content-Type': 'application/json',
          },
        });

        if (response.status === 200) {

          const products = response.data.payload;
          const maxPrice = Math.max(...products.map((product) => product.price));
  
          setHighestPrice(maxPrice);
          setPriceRange([0, maxPrice]); 
          setData(products);
        }

        setLoading(false);
      } catch (error) {
        navigate('/403');
      }
    };

    fetchData();
    
    if(queryValue && queryValue !== "") {
      setSearchQuery(decodeURIComponent(queryValue));
    }

  }, [navigate, queryValue]);

  const handlePriceChange = (newRange) => {
    setPriceRange(newRange);
  };

  const filteredData = data.filter((product) => {
    if (selectedGenres.length === 0) {

      return (
        product.name.toLowerCase().includes(searchQuery.toLowerCase()) &&
        parseFloat(product.price) >= parseFloat(priceRange[0]) &&
        parseFloat(product.price) <= parseFloat(priceRange[1])
      );
    }

    return (
      product.genres.some((genre) => selectedGenres.includes(genre.id)) &&
      product.name.toLowerCase().includes(searchQuery.toLowerCase()) &&
      parseFloat(product.price) >= parseFloat(priceRange[0]) &&
      parseFloat(product.price) <= parseFloat(priceRange[1])
    );
  });

  const filteredProducts = filteredData.map((product, index) => (
    <Item key={index} product={product} openPopup={openPopup} />
  ));

  return loading ? (
    <LoadingSpinner />
  ) : data != null ? (
    <div className="bg-gray-100 dark:bg-slate-800 dark:text-white min-h-screen pb-5">
      {open ? (
        <Popup data={popupData} closePopup={() => setOpen(false)} />
      ) : (
        <div></div>
      )}
      <Navbar />
      <div className="min-h-screen mt-20">
        <section>
          <SearchBar initQuery={queryValue} onSearch={setSearchQuery} />
          {/* Filter and Items Container */}
          <div className="flex flex-col lg:flex-row lg:items-start">
            {/* Filter Sidebar */}
            <FilterSidebar queryGenre={genreValue} selectedGenres={selectedGenres} setSelectedGenres={setSelectedGenres} maxPrice={highestPrice} range={handlePriceChange}/>
            {/* Items Container */}
            <div className="dark:bg-slate-800 flex flex-col basis-3/4 p-6 m-3 bg-gray-50 rounded-2xl md:rounded-none md:flex-row md:space-y-0 md:space-x-10 md:m-0 md:p-16 md:pt-0">
              {/* Grid Container */}
              <div className="grid gap-4 lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 mx-auto">
                {filteredProducts.length > 0 ? (
                  filteredProducts
                ) : (
                  <p className='inline'>No products match the selected genres or search criteria.</p>
                )}
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  ) : (
    <></>
  );
}

export default Store;
