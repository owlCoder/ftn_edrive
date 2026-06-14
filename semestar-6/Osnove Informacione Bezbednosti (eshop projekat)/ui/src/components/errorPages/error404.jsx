import React from "react";
import { useNavigate } from "react-router-dom";

const Error404Page = () => {
  const navigate = useNavigate();

  const navigateToHomepage = () => {
    navigate("/");
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100 dark:bg-gray-900">
      <div className="max-w-md w-full p-6 bg-white dark:bg-gray-800 rounded-lg shadow-lg">
        <h1 className="text-5xl text-rose-700 dark:text-rose-700 font-semibold">
          404
        </h1>
        <p className="text-2xl text-gray-800 dark:text-gray-200 font-semibold mt-4">
          Page Not Found
        </p>
        <p className="text-gray-600 dark:text-gray-400 mt-4">
          The page you are looking for does not exist.
        </p>
        <div className="mt-6">
          <button
            className="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded-md"
            onClick={navigateToHomepage}
          >
            Back to Homepage
          </button>
        </div>
      </div>
    </div>
  );
};

export default Error404Page;