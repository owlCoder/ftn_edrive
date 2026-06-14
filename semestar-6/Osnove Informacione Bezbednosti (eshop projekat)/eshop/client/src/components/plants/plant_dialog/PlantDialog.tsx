import React, { useState, useEffect } from "react";
import { PlantStatus } from "../../../enums/PlantStatus";
import { PlantDTO } from "../../../models/plants/PlantDTO";

type PlantDialogProps = {
  isOpen: boolean;
  onClose: () => void;
  onSave: (plant: PlantDTO) => void;
  plant?: PlantDTO | null;
  isLoading?: boolean;
};

export const PlantDialog: React.FC<PlantDialogProps> = ({
  isOpen,
  onClose,
  onSave,
  plant,
  isLoading = false,
}) => {
  const [formData, setFormData] = useState<PlantDTO>({
    commonName: "",
    latinName: "",
    aromaticOilStrength: 1.0,
    countryOfOrigin: "",
    status: PlantStatus.PLANTED,
  });

  const [errors, setErrors] = useState<Record<string, string>>({});

  useEffect(() => {
    if (plant) {
      setFormData(plant);
    } else {
      setFormData({
        commonName: "",
        latinName: "",
        aromaticOilStrength: 1.0,
        countryOfOrigin: "",
        status: PlantStatus.PLANTED,
      });
    }
    setErrors({});
  }, [plant, isOpen]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: name === "aromaticOilStrength" ? parseFloat(value) : value,
    });
    setErrors({ ...errors, [name]: "" });
  };

  const validate = (): boolean => {
    const newErrors: Record<string, string> = {};

    if (!formData.commonName.trim()) {
      newErrors.commonName = "Common name is required";
    }

    if (!formData.latinName.trim()) {
      newErrors.latinName = "Latin name is required";
    }

    if (!formData.countryOfOrigin.trim()) {
      newErrors.countryOfOrigin = "Country of origin is required";
    }

    if (formData.aromaticOilStrength < 1.0 || formData.aromaticOilStrength > 5.0) {
      newErrors.aromaticOilStrength = "Oil strength must be between 1.0 and 5.0";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (validate()) {
      onSave(formData);
    }
  };

  if (!isOpen) return null;

  return (
    <div className="overlay" onClick={onClose}>
      <div className="window" style={{ width: "550px", maxWidth: "90%" }} onClick={(e) => e.stopPropagation()}>
        <div className="titlebar">
          <span className="titlebar-title">{plant ? "Edit Plant" : "Add New Plant"}</span>
          <div className="titlebar-controls">
            <button className="titlebar-btn close" onClick={onClose} aria-label="Close" disabled={isLoading}>
              <svg width="10" height="10" viewBox="0 0 10 10">
                <path d="M0 0L10 10M10 0L0 10" stroke="currentColor" strokeWidth="1" />
              </svg>
            </button>
          </div>
        </div>

        <div className="window-content">
          <form onSubmit={handleSubmit} className="flex flex-col gap-4">
            <div>
              <label htmlFor="commonName" style={{ display: "block", marginBottom: "8px", fontSize: "14px", fontWeight: 600 }}>
                Common Name *
              </label>
              <input
                type="text"
                id="commonName"
                name="commonName"
                value={formData.commonName}
                onChange={handleChange}
                placeholder="e.g., Lavender"
                disabled={isLoading}
              />
              {errors.commonName && <span style={{ fontSize: "12px", color: "var(--win11-close-hover)" }}>{errors.commonName}</span>}
            </div>

            <div>
              <label htmlFor="latinName" style={{ display: "block", marginBottom: "8px", fontSize: "14px", fontWeight: 600 }}>
                Latin Name *
              </label>
              <input
                type="text"
                id="latinName"
                name="latinName"
                value={formData.latinName}
                onChange={handleChange}
                placeholder="e.g., Lavandula angustifolia"
                disabled={isLoading}
              />
              {errors.latinName && <span style={{ fontSize: "12px", color: "var(--win11-close-hover)" }}>{errors.latinName}</span>}
            </div>

            <div>
              <label htmlFor="aromaticOilStrength" style={{ display: "block", marginBottom: "8px", fontSize: "14px", fontWeight: 600 }}>
                Aromatic Oil Strength * (1.0 - 5.0)
              </label>
              <input
                type="number"
                id="aromaticOilStrength"
                name="aromaticOilStrength"
                value={formData.aromaticOilStrength}
                onChange={handleChange}
                min="1.0"
                max="5.0"
                step="0.1"
                disabled={isLoading}
              />
              {errors.aromaticOilStrength && <span style={{ fontSize: "12px", color: "var(--win11-close-hover)" }}>{errors.aromaticOilStrength}</span>}
            </div>

            <div>
              <label htmlFor="countryOfOrigin" style={{ display: "block", marginBottom: "8px", fontSize: "14px", fontWeight: 600 }}>
                Country of Origin *
              </label>
              <input
                type="text"
                id="countryOfOrigin"
                name="countryOfOrigin"
                value={formData.countryOfOrigin}
                onChange={handleChange}
                placeholder="e.g., France"
                disabled={isLoading}
              />
              {errors.countryOfOrigin && <span style={{ fontSize: "12px", color: "var(--win11-close-hover)" }}>{errors.countryOfOrigin}</span>}
            </div>

            <div>
              <label htmlFor="status" style={{ display: "block", marginBottom: "8px", fontSize: "14px", fontWeight: 600 }}>
                Status *
              </label>
              <select
                id="status"
                name="status"
                value={formData.status}
                onChange={handleChange}
                disabled={isLoading}
              >
                <option value={PlantStatus.PLANTED}>Planted (Posađena)</option>
                <option value={PlantStatus.HARVESTED}>Harvested (Ubrana)</option>
                <option value={PlantStatus.PROCESSED}>Processed (Prerađena)</option>
              </select>
            </div>

            <div className="flex gap-2" style={{ marginTop: "8px" }}>
              <button
                type="submit"
                className="btn btn-accent"
                style={{ flex: 1 }}
                disabled={isLoading}
              >
                {isLoading ? (
                  <div className="flex items-center gap-2">
                    <div className="spinner" style={{ width: "16px", height: "16px", borderWidth: "2px" }}></div>
                    <span>Saving...</span>
                  </div>
                ) : (
                  plant ? "Update Plant" : "Add Plant"
                )}
              </button>
              <button
                type="button"
                className="btn btn-standard"
                onClick={onClose}
                disabled={isLoading}
              >
                Cancel
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};