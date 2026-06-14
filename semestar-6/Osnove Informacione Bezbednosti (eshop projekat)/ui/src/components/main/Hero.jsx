import { React, useState } from "react";
import { AiOutlineSearch } from "react-icons/ai";
import { useNavigate } from 'react-router-dom';

export const HeroSection = () => {
    const [searchQuery, setSearchQuery] = useState('');
    const navigate = useNavigate();

    return (
        <section className="mb-16 flex flex-col justify-between gap-6 sm:gap-10 md:mb-16 md:gap-16 lg:flex-row md:mt-32 mx-6 mt-20 md:mx-24">
            <div className="flex flex-col justify-center sm:text-center lg:py-12 lg:text-left xl:w-5/12">
                <h1 className="mb-8 text-4xl text-center font-bold text-black sm:text-5xl md:mb-12 md:text-6xl dark:text-white">
                    Everything you need in just one click.</h1>
                <div className="flex flex-col gap-2.5 sm:flex-row sm:justify-center lg:justify-start">
                    {/* Search Bar */}
                    <input
                        type="text"
                        placeholder="Search for products..."
                        className="w-full p-2 mb-4 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-xl"
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                        style={{ outline: 'none' }}
                    />
                    
                    <button
                        className="new-account-button inline mb-4 mx-auto"
                        style={{ fontSize: 16, fontWeight: '600' }}
                        onClick={() => { let query = "/store?query=" + searchQuery; navigate(query) }}
                    >
                        <AiOutlineSearch className="plus-icon" />
                        &nbsp;Search
                    </button>
                    
                    
                </div>
            </div>

            <div className="h-48 overflow-hidden rounded-lg bg-gray-100 shadow-lg lg:h-96 xl:w-5/12">
                <video autoPlay loop muted playsInline className="h-full w-full object-cover object-center">
                    <source src="demo.mp4" type="video/mp4" />
                    Your browser does not support the video tag.
                </video>
            </div>
        </section>
    );
};