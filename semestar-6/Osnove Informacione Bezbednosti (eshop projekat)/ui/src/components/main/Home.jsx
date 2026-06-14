import Navbar from "../navigation/Navbar";
import React, { useEffect, useState, useSyncExternalStore } from "react";
import { Popup } from "./Popup";
import Item from "../product/Item";
import { HeroSection } from "./Hero";
import { Card } from "../cards/Card";
import { Footer } from "../footer/Footer";
import axios from "axios";

export default function Home() {

  const [open, setOpen] = useState(false);
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [genres, setGenres] = useState([]);

  const openPopup = (data) => {
    setOpen(true);
    setData(data);
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
          // Create an object to store genre counts
          const genreCounts = {};

          // Iterate through each product
          products.forEach(product => {
            // Access the 'genres' array in each product
            const genres = product.genres || [];

            // Count occurrences of each genre
            genres.forEach(genre => {
              // Check if the genre exists in the count object
              if (genreCounts[genre.name]) {
                // Increment the count if the genre already exists
                genreCounts[genre.name]++;
              } else {
                // Initialize count to 1 if the genre doesn't exist
                genreCounts[genre.name] = 1;
              }
            });
          });

          // Convert genreCounts object to an array of objects for easier sorting
          const genreCountsArray = Object.keys(genreCounts).map(genre => ({
            genre: genre,
            count: genreCounts[genre],
          }));

          // Sort the genreCountsArray based on the count in descending order
          genreCountsArray.sort((a, b) => b.count - a.count);

          // Now genreCountsArray contains genres sorted by popularity (most popular to least popular)
          setGenres(genreCountsArray);
          setLoading(false);
        }

      } catch (error) {

      }
    };

    fetchData();
  }, [])

  return (
    <main className="dark:bg-gray-900 bg-gray-100 dark:text-white min-h-screen pb-2">
      {open ? <Popup data={data} closePopup={() => setOpen(false)} /> : <></>}
      <Navbar />

      <div className="pt-10 md:pt-0">
        <HeroSection />
      </div>


      <section className="mt-20 md:mt-40 mb-20">
        {!loading && genres.length >= 3 && (
          <div className="flex justify-center items-center flex-col md:flex-row md:space-x-12 md:space-y-0 space-y-12 mx-10">
            <Card
              year={genres[0].genre}
              title={"This week numero uno"}
              hyperlink={"/store?genre=" + genres[0].genre}
              hyperlinkText={"Exlore in caterogy"}
            />
            <Card
              year={genres[1].genre}
              title={"Silver shines like a gold!"}
              hyperlink={"/store?genre=" + genres[1].genre}
              hyperlinkText={"Exlore in caterogy"}
            />
            <Card
              year={genres[2].genre}
              title={"Bronze goes to..."}
              hyperlink={"/store?genre=" + genres[2].genre}
              hyperlinkText={"Exlore in caterogy"}
            />
          </div>
        )}
      </section>


      {/* Footer */}
      <section className="mt-20 mb-1">
        <Footer />
      </section>
    </main>
  );
}


