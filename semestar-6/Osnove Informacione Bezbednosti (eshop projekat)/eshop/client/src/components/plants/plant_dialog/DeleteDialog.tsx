import React from "react";
import { PlantDTO } from "../../../models/plants/PlantDTO";

type DeletePlantDialogProps = {
  isOpen: boolean;
  onClose: () => void;
  onConfirm: () => void;
  plant?: PlantDTO | null;
  isLoading?: boolean;
};

export const DeletePlantDialog: React.FC<DeletePlantDialogProps> = ({
  isOpen,
  onClose,
  onConfirm,
  plant,
  isLoading = false,
}) => {
  if (!isOpen || !plant) return null;

  return (
    <div className="overlay" onClick={onClose}>
      <div className="window" style={{ width: "400px", maxWidth: "90%" }} onClick={(e) => e.stopPropagation()}>
        <div className="titlebar">
          <span className="titlebar-title">Delete Plant</span>
          <div className="titlebar-controls">
            <button className="titlebar-btn close" onClick={onClose} aria-label="Close" disabled={isLoading}>
              <svg width="10" height="10" viewBox="0 0 10 10">
                <path d="M0 0L10 10M10 0L0 10" stroke="currentColor" strokeWidth="1" />
              </svg>
            </button>
          </div>
        </div>

        <div className="window-content">
          <div style={{ textAlign: "center", padding: "20px" }}>
            <svg
              width="48"
              height="48"
              viewBox="0 0 24 24"
              fill="none"
              stroke="var(--win11-close-hover)"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              style={{ marginBottom: "12px" }}
            >
              <circle cx="12" cy="12" r="10" />
              <line x1="15" y1="9" x2="9" y2="15" />
              <line x1="9" y1="9" x2="15" y2="15" />
            </svg>

            <h3 style={{ marginBottom: "8px" }}>Delete Plant</h3>
            <p style={{ color: "var(--win11-text-secondary)", fontSize: "14px" }}>
              Are you sure you want to delete <strong>{plant.commonName}</strong>? This action cannot be undone.
            </p>

            <div className="flex gap-2" style={{ marginTop: "20px" }}>
              <button
                className="btn btn-accent"
                style={{ flex: 1, backgroundColor: "var(--win11-close-hover)", color: '#ffffff'  }}
                onClick={onConfirm}
                disabled={isLoading}
              >
                {isLoading ? "Deleting..." : "Yes, Delete"}
              </button>
              <button className="btn btn-standard" style={{ flex: 1 }} onClick={onClose} disabled={isLoading}>
                Cancel
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
