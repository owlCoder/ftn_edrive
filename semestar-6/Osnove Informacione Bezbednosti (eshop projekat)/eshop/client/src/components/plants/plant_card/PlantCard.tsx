import React from "react";
import { PlantDTO } from "../../../models/plants/PlantDTO";

type PlantCardProps = {
  plant: PlantDTO;
  onEdit: (plant: PlantDTO) => void;
  onDelete: (plant: PlantDTO) => void;
};

export const PlantCard: React.FC<PlantCardProps> = ({ plant, onEdit, onDelete }) => {
  const getStatusBadgeColor = (status: string): string => {
    switch (status) {
      case "PLANTED":
        return "#107c10";
      case "HARVESTED":
        return "#ca5010";
      case "PROCESSED":
        return "#0078d4";
      default:
        return "var(--win11-text-tertiary)";
    }
  };

  const getStatusLabel = (status: string): string => {
    switch (status) {
      case "PLANTED":
        return "Posađena";
      case "HARVESTED":
        return "Ubrana";
      case "PROCESSED":
        return "Prerađena";
      default:
        return status;
    }
  };

  return (
    <div className="card acrylic">
      <div className="flex items-center justify-between" style={{ marginBottom: "12px" }}>
        <h3 style={{ margin: 0, fontSize: "16px" }}>{plant.commonName}</h3>
        <div
          style={{
            padding: "4px 10px",
            borderRadius: "4px",
            fontSize: "11px",
            fontWeight: 600,
            backgroundColor: `${getStatusBadgeColor(plant.status)}20`,
            color: getStatusBadgeColor(plant.status),
          }}
        >
          {getStatusLabel(plant.status)}
        </div>
      </div>

      <div className="flex flex-col gap-2" style={{ marginBottom: "16px" }}>
        <div className="flex items-center gap-2">
          <span style={{ fontSize: "13px", fontStyle: "italic", color: "var(--win11-text-secondary)" }}>
            {plant.latinName}
          </span>
        </div>
        <div className="flex items-center gap-2">
          <span style={{ fontSize: "13px", color: "var(--win11-text-secondary)" }}>
            {plant.countryOfOrigin}
          </span>
        </div>
        <div className="flex items-center gap-2">
          <span style={{ fontSize: "13px", color: "var(--win11-text-secondary)" }}>
            Oil Strength: <strong>{plant.aromaticOilStrength.toFixed(1)}</strong>/5.0
          </span>
        </div>
        <div className="progress" style={{ marginTop: "4px" }}>
          <div
            className="progress-bar"
            style={{ width: `${(plant.aromaticOilStrength / 5.0) * 100}%` }}
          ></div>
        </div>
      </div>

      <div className="flex gap-2">
        <button
          className="btn btn-standard"
          style={{ flex: 1 }}
          onClick={() => onEdit(plant)}
        >
          Edit
        </button>
        <button
          className="btn btn-standard"
          style={{ color: "var(--win11-close-hover)" }}
          onClick={() => onDelete(plant)}
        >
          Delete
        </button>
      </div>
    </div>
  );
};
