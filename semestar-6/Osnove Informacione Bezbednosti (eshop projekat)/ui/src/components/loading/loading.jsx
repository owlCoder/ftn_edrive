import React from "react";

const LoadingSpinner = () => {
  const containerStyles = {
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    minHeight: "100vh",
  };

  const spinnerStyles = {
    width: "50px",
    height: "50px",
    border: "6px solid transparent",
    borderTop: "6px solid #124191",
    borderRadius: "50%",
    animation: "spin 2s linear infinite",
  };

  return (
    <div style={containerStyles} className="bg-white dark:bg-gray-900">
      <div style={spinnerStyles}></div>
    </div>
  );
};

export default LoadingSpinner;
