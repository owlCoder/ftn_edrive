import React, { useState } from "react";
import { useAuth } from "../../contexts/AuthContext";
import { useNavigate } from "react-router-dom";
import axios from "axios";

export const Popup = ({ data, closePopup }) => {
  const [counter, setCounter] = useState(1);

  const navigate = useNavigate();
  const { currentUser } = useAuth();

  // info modal
  const [showModal, setShowModal] = useState(false);
  const [modalText, setModalText] = useState("");
  const [modalDesc, setModalDesc] = useState("");

  const changeQuantity = (plusOrMinus) => {
    if (plusOrMinus)
      if (counter + 1 <= data.quantity)
        setCounter(prevCounter => prevCounter + 1);
      else
        if (counter - 1 >= 1)
          setCounter(prevCounter => prevCounter - 1);
  };

  const makeAnOrder = async () => {
    try {
      const token = await currentUser.getIdToken();
      const response = await axios.post(
        global.APIEndpoint + "/api/order/create",
        {
          buyQuantity: counter,
          buyerUid: currentUser.uid,
          product: data
        },
        {
          headers: {
            Authorization: `${token}`,
            "Content-Type": "application/json",
          },
        }
      );

      if (response.status !== 201)
        navigate('/' + response.status.toString());

      data.quantity -= counter;
      setCounter(1);

      setModalText("Order has been completed");
      setModalDesc("Product(s) with desired quantity has been added to your account.");
      setShowModal(true);
    } catch (error) {
      setModalText("Order canceled");
      setModalDesc("Order can't be full-filled right now. Product is unavailable.");
      setShowModal(true);
    }
  }

  // Modal handle functions
  const handleGotItClick = () => {
    setShowModal(false);
  };

  return (
    <div>
      {showModal && (
        <div className="fixed inset-0 flex items-center justify-center z-50 backdrop-blur-2xl backdrop-filter dark:backdrop-blur-2xl dark:backdrop-filter">
          <div className="bg-white w-96 rounded-lg p-6 shadow-lg dark:bg-gray-900 transition-opacity duration-300">
            <h2 className="text-xl font-semibold mb-4 dark:text-white">
              {modalText}
            </h2>
            <p className="text-gray-600 dark:text-gray-400">{modalDesc}</p>
            <button
              onClick={handleGotItClick}
              className="bg-blue-500 text-white font-semibold px-4 py-2 rounded mt-4 hover:bg-blue-600"
            >
              Got it
            </button>
          </div>
        </div>
      )}

      <div className="z-40 fixed inset-0 flex items-center justify-center min-h-screen text-black dark:text-gray-300 backdrop-blur-md backdrop-filter dark:backdrop-blur-md dark:backdrop-filter mb-16 md:mt-6">
        {/* Card Container */}
        <div className="relative flex flex-col py-16 pr-32 pl-16 md:mx-6 space-y-10 border-2 border-gray-200 bg-gray-50 dark:bg-gray-900 dark:border-gray-800 dark:text-gray-300 rounded-2xl shadow-2xl md:flex-row md:space-y-0 md:space-x-6">

          {/* Close Button */}
          <button className="absolute top-6 right-9 p-2 hover:text-gray-500" onClick={closePopup}>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
              <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>

          {/* Image Div */}
          <div className="flex items-center justify-center">
            <img src={data.photoBase64} alt="" className="mx-auto duration-200 w-60 hover:scale-105 md:mr-6" />
          </div>

          {/* Content */}
          <div className="flex flex-col space-y-6 text-center">
            {/* Label, Title & Price Container */}
            <div className="flex flex-col mb-4 space-y-3 text-center md:text-left">
              <div>
                <div className="inline-block px-3 py-1 text-sm text-white bg-black rounded-full">
                  {data.productionYear}
                </div>
              </div>

              {/* Price Container */}
              <div className="flex flex-col mb-4 space-y-3 text-center md:text-left">
                <p className="text-4xl font-bold">{data.name}</p>
              </div>

              {/* Title and info */}
              <div className="flex flex-col items-center justify-center md:items-start space-y-3">
                <div className="max-w-sm text-2xl font-medium">
                  {data.price}€
                </div>
                <p className="text-sm font-light text-gray-400">
                  Available until: {data.dateValidity}
                </p>
              </div>

            </div>

            {/* Description */}
            <div className="max-w-xl md:text-left flex flex-col gap-2">
              <p>{data.used ? "Used" : "New"}</p>
              <p>In Stock: {data.quantity}</p>
              <p>Author: {data.author}</p>
              <p>Genres: {data.genres.map(item => <li key={item.id}>{item.name}</li>)}</p>
            </div>

            {/* Button & Number Input */}
            <div className="flex items-center justify-center md:justify-start space-x-5">
              {/* Number Input */}
              <div className="custom-number-input h-10 w-32">
                <div className="flex flex-row h-10 w-full rounded-lg relative bg-transparent">
                  <button id="minus" onClick={() => { changeQuantity(false) }} className="pb-1 bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-l cursor-pointer outline-none">
                    <span className="m-auto text-2xl font-thin">-</span>
                  </button>
                  <input
                    type="number"
                    value={counter}
                    readOnly
                    onChange={(e) => setCounter(parseInt(e.target.value, 10))}
                    className="[appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none outline-none focus:outline-none text-center w-full bg-gray-300 font-semibold text-md hover:text-black focus:text-black md:text-basecursor-default flex items-center text-gray-700  "
                    name="custom-input-number"
                  />
                  <button id="plus" onClick={() => { changeQuantity(true) }} data-action="increment" className="pb-1 bg-gray-300 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-20 rounded-r cursor-pointer">
                    <span className="m-auto text-2xl font-thin">+</span>
                  </button>
                </div>
              </div>

              {/* Buy Button */}
              <button onClick={() => { makeAnOrder() }} className="h-10 text-white text-sm bg-primary-700 hover:bg-primary-800 focus-ring-4 focus-ring-primary-300 font-medium rounded-lg px-9 py-1.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus-ring-primary-800" type="button">
                Buy
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};