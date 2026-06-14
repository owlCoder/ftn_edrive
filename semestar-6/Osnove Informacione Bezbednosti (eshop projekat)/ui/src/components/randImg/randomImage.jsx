import React, { useState } from 'react';

const ImagePicker = () => {
  // Array of image filenames
  const imageArray = ['w1.jpg', 'w2.jpg', 'w3.jpg', 'w4.jpg', 'w5.jpg', 'w6.jpg'];

  // Function to randomly pick an image
  const getRandomImage = () => {
    const randomIndex = Math.floor(Math.random() * imageArray.length);
    return imageArray[randomIndex];
  };

  const [selectedImage] = useState(getRandomImage());

  return (
      <img
        src={`/${selectedImage}`}
        alt="img"
        width="300"
        height="200"
        className="w-full h-full object-cover"
      />
  );
};

export default ImagePicker;
