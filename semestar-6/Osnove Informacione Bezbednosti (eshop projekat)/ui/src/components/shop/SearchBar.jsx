import React, { useEffect, useState } from 'react';

const SearchBar = ({ onSearch, initQuery }) => {
  const [searchQuery, setSearchQuery] = useState('');

  const handleSearchChange = (e) => {
    const query = e.target.value;
    setSearchQuery(query);
    onSearch(query);
  };

  useEffect(() => {
    if(initQuery && initQuery !== "") {
      setSearchQuery(initQuery);
      onSearch(initQuery);
    }
  }, [initQuery])

  return (
    <div className="flex items-center justify-center mb-8">
      <div className="md:max-w-3xl max-w-sm mx-2 w-full">
        <input
          type="text"
          placeholder="Search for products..."
          className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-xl focus:outline-none"
          value={searchQuery}
          onChange={handleSearchChange}
        />
      </div>      
    </div>
  );
};

export default SearchBar;
