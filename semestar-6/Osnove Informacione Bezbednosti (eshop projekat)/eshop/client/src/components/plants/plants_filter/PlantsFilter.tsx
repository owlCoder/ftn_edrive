import React from "react";
import { PlantFiltersTypes } from "../../../types/PlantFilterTypes";
import { PlantStatus } from "../../../enums/PlantStatus";

type PlantFiltersProps = {
  filters: PlantFiltersTypes;
  onFilterChange: (filters: PlantFiltersTypes) => void;
  countries: string[];
};

export const PlantFilters: React.FC<PlantFiltersProps> = ({ filters, onFilterChange, countries }) => {
  const handleStatusChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    onFilterChange({
      ...filters,
      status: e.target.value === "all" ? undefined : (e.target.value as PlantStatus),
    });
  };

  const handleCountryChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    onFilterChange({
      ...filters,
      countryOfOrigin: e.target.value === "all" ? undefined : e.target.value,
    });
  };

  const handleMinOilChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    onFilterChange({
      ...filters,
      minOilStrength: e.target.value ? parseFloat(e.target.value) : undefined,
    });
  };

  const handleMaxOilChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    onFilterChange({
      ...filters,
      maxOilStrength: e.target.value ? parseFloat(e.target.value) : undefined,
    });
  };

  const handleReset = () => {
    onFilterChange({});
  };

  return (
    <div className="card acrylic" style={{ marginBottom: "20px" }}>
      <div className="flex items-center justify-between" style={{ marginBottom: "16px" }}>
        <h3 style={{ margin: 0 }}>Filters</h3>
        <button className="btn btn-ghost" onClick={handleReset} style={{ padding: "6px 12px", fontSize: "13px" }}>
          Reset
        </button>
      </div>

      <div className="flex gap-3" style={{ flexWrap: "wrap" }}>
        <div style={{ flex: "1 1 200px" }}>
          <label style={{ display: "block", marginBottom: "6px", fontSize: "13px", fontWeight: 600 }}>
            Status
          </label>
          <select value={filters.status || "all"} onChange={handleStatusChange} style={{ fontSize: "13px" }}>
            <option value="all">All Statuses</option>
            <option value={PlantStatus.PLANTED}>Planted</option>
            <option value={PlantStatus.HARVESTED}>Harvested</option>
            <option value={PlantStatus.PROCESSED}>Processed</option>
          </select>
        </div>

        <div style={{ flex: "1 1 200px" }}>
          <label style={{ display: "block", marginBottom: "6px", fontSize: "13px", fontWeight: 600 }}>
            Country
          </label>
          <select value={filters.countryOfOrigin || "all"} onChange={handleCountryChange} style={{ fontSize: "13px" }}>
            <option value="all">All Countries</option>
            {countries.map((country) => (
              <option key={country} value={country}>
                {country}
              </option>
            ))}
          </select>
        </div>

        <div style={{ flex: "1 1 150px" }}>
          <label style={{ display: "block", marginBottom: "6px", fontSize: "13px", fontWeight: 600 }}>
            Min Oil Strength
          </label>
          <input
            type="number"
            value={filters.minOilStrength || ""}
            onChange={handleMinOilChange}
            placeholder="1.0"
            min="1.0"
            max="5.0"
            step="0.1"
            style={{ fontSize: "13px" }}
          />
        </div>

        <div style={{ flex: "1 1 150px" }}>
          <label style={{ display: "block", marginBottom: "6px", fontSize: "13px", fontWeight: 600 }}>
            Max Oil Strength
          </label>
          <input
            type="number"
            value={filters.maxOilStrength || ""}
            onChange={handleMaxOilChange}
            placeholder="5.0"
            min="1.0"
            max="5.0"
            step="0.1"
            style={{ fontSize: "13px" }}
          />
        </div>
      </div>
    </div>
  );
};