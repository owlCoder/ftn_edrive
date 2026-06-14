import React, { useEffect, useState } from "react";
import { IPlantAPI } from "../api/plants/IPlantAPI";
import { IUserAPI } from "../api/users/IUserAPI";
import { DashboardNavbar } from "../components/dashboard/navbar/Navbar";
import { PlantFilters } from "../components/plants/plants_filter/PlantsFilter";
import { PlantDTO } from "../models/plants/PlantDTO";
import { PlantFiltersTypes } from "../types/PlantFilterTypes";
import { PlantDialog } from "../components/plants/plant_dialog/PlantDialog";
import { useAuth } from "../hooks/useAuthHook";
import { DeletePlantDialog } from "../components/plants/plant_dialog/DeleteDialog";
import { PlantCard } from "../components/plants/plant_card/PlantCard";

type DashboardPageProps = {
  plantAPI: IPlantAPI;
  userAPI: IUserAPI;
};

export const DashboardPage: React.FC<DashboardPageProps> = ({ plantAPI, userAPI }) => {
  const [plants, setPlants] = useState<PlantDTO[]>([]);
  const [filteredPlants, setFilteredPlants] = useState<PlantDTO[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [filters, setFilters] = useState<PlantFiltersTypes>({});
  const [isLoading, setIsLoading] = useState(true);
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [selectedPlant, setSelectedPlant] = useState<PlantDTO | null>(null);
  const [isSaving, setIsSaving] = useState(false);
  const [error, setError] = useState<string>("");
  const { token } = useAuth();
  const [isDeleteDialogOpen, setIsDeleteDialogOpen] = useState(false);
  const [plantToDelete, setPlantToDelete] = useState<PlantDTO | null>(null);

  useEffect(() => {
    fetchPlants();
  }, []);

  useEffect(() => {
    applyFilters();
  }, [plants, searchQuery, filters]);

  const fetchPlants = async () => {
    setIsLoading(true);
    setError("");
    try {
      const data = await plantAPI.getAllPlants(token ?? "");
      setPlants(data);
    } catch (err) {
      setError("Failed to load plants. Please try again.");
      console.error(err);
    } finally {
      setIsLoading(false);
    }
  };

  const applyFilters = () => {
    let filtered = [...plants];

    // Search filter
    if (searchQuery.trim()) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter(
        (p) =>
          p.commonName.toLowerCase().includes(query) ||
          p.latinName.toLowerCase().includes(query) ||
          p.countryOfOrigin.toLowerCase().includes(query)
      );
    }

    // Status filter
    if (filters.status) {
      filtered = filtered.filter((p) => p.status === filters.status);
    }

    // Country filter
    if (filters.countryOfOrigin) {
      filtered = filtered.filter((p) => p.countryOfOrigin === filters.countryOfOrigin);
    }

    // Oil strength filters
    if (filters.minOilStrength) {
      filtered = filtered.filter((p) => p.aromaticOilStrength >= filters.minOilStrength!);
    }
    if (filters.maxOilStrength) {
      filtered = filtered.filter((p) => p.aromaticOilStrength <= filters.maxOilStrength!);
    }

    setFilteredPlants(filtered);
  };

  const handleAddPlant = () => {
    setSelectedPlant(null);
    setIsDialogOpen(true);
  };

  const handleEditPlant = (plant: PlantDTO) => {
    setSelectedPlant(plant);
    setIsDialogOpen(true);
  };

  const handleDeletePlantRequest = (plant: PlantDTO) => {
    setPlantToDelete(plant);
    setIsDeleteDialogOpen(true);
  };

  const handleConfirmDelete = async () => {
    if (!plantToDelete) return;
    try {
      await plantAPI.deletePlant(plantToDelete.id!, token ?? "");
      setIsDeleteDialogOpen(false);
      await fetchPlants();
    } catch (err) {
      alert("Failed to delete plant.");
    }
  };

  const handleSavePlant = async (plant: PlantDTO) => {
    setIsSaving(true);
    try {
      if (plant.id) {
        await plantAPI.updatePlant(plant.id, plant, token ?? "");
      } else {
        await plantAPI.createPlant(plant, token ?? "");
      }
      setIsDialogOpen(false);
      await fetchPlants();
    } catch (err) {
      alert("Failed to save plant. Please try again.");
      console.error(err);
    } finally {
      setIsSaving(false);
    }
  };

  const getUniqueCountries = (): string[] => {
    return Array.from(new Set(plants.map((p) => p.countryOfOrigin))).sort();
  };

  return (
    <div style={{ minHeight: "100vh", background: "var(--win11-bg)" }}>
      <DashboardNavbar userAPI={userAPI} />

      <div style={{ maxWidth: "1400px", margin: "0 auto", padding: "24px" }}>
        {/* Header */}
        <div className="flex items-center justify-between" style={{ marginBottom: "24px" }}>
          <div>
            <h1 style={{ marginBottom: "8px" }}>Plant Management</h1>
            <p style={{ margin: 0, color: "var(--win11-text-secondary)" }}>
              Manage aromatic plants and their properties
            </p>
          </div>
          <button className="btn btn-accent" onClick={handleAddPlant}>
            <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
              <path d="M8 2v6m0 0v6m0-6h6m-6 0H2" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
            </svg>
            Add Plant
          </button>
        </div>

        {/* Search Bar */}
        <div className="card acrylic" style={{ marginBottom: "20px" }}>
          <div style={{ position: "relative" }}>
            <svg
              width="16"
              height="16"
              viewBox="0 0 16 16"
              fill="var(--win11-text-tertiary)"
              style={{ position: "absolute", left: "12px", top: "50%", transform: "translateY(-50%)" }}
            >
              <path d="M7 2a5 5 0 104.906 4.095A5 5 0 007 2zm0 1a4 4 0 110 8 4 4 0 010-8zm4.618 8.032l2.675 2.675a.5.5 0 01-.707.707l-2.675-2.675a.5.5 0 01.707-.707z" />
            </svg>
            <input
              type="search"
              placeholder="Search plants by name, latin name, or country..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              style={{ paddingLeft: "40px", fontSize: "14px" }}
            />
          </div>
        </div>

        {/* Filters */}
        <PlantFilters filters={filters} onFilterChange={setFilters} countries={getUniqueCountries()} />

        {/* Error Message */}
        {error && (
          <div className="card" style={{ marginBottom: "20px", backgroundColor: "rgba(196, 43, 28, 0.15)", borderColor: "var(--win11-close-hover)" }}>
            <p style={{ margin: 0, color: "var(--win11-text-primary)" }}>{error}</p>
          </div>
        )}

        {/* Loading State */}
        {isLoading ? (
          <div className="card acrylic" style={{ padding: "60px", textAlign: "center" }}>
            <div className="flex flex-col items-center gap-3">
              <div className="spinner"></div>
              <p>Loading plants...</p>
            </div>
          </div>
        ) : (
          <>
            {/* Results Count */}
            <div style={{ marginBottom: "16px" }}>
              <p style={{ margin: 0, fontSize: "13px" }}>
                Showing {filteredPlants.length} of {plants.length} plants
              </p>
            </div>

            {/* Plants Grid */}
            {filteredPlants.length === 0 ? (
              <div className="card acrylic" style={{ padding: "60px", textAlign: "center" }}>
                <svg width="64" height="64" viewBox="0 0 64 64" fill="var(--win11-text-tertiary)" style={{ margin: "0 auto 16px" }}>
                  <path d="M32 8a24 24 0 100 48 24 24 0 000-48zm0 4a20 20 0 110 40 20 20 0 010-40zm-2 8v12h-8v4h8v8h4v-8h8v-4h-8V20h-4z" opacity="0.3"/>
                </svg>
                <p style={{ fontSize: "16px", margin: 0 }}>No plants found matching your criteria.</p>
                <button className="btn btn-standard" onClick={() => { setSearchQuery(""); setFilters({}); }} style={{ marginTop: "16px" }}>
                  Clear Filters
                </button>
              </div>
            ) : (
             <div
                style={{
                  display: "grid",
                  gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))",
                  gap: "20px",
                }}
              >
                {filteredPlants.map((plant) => (
                  <PlantCard
                    key={plant.id}
                    plant={plant}
                    onEdit={handleEditPlant}
                    onDelete={handleDeletePlantRequest}
                  />
                ))}
              </div>
            )}
          </>
        )}
      </div>

      {/* Plant Dialog */}
      <PlantDialog
        isOpen={isDialogOpen}
        onClose={() => setIsDialogOpen(false)}
        onSave={handleSavePlant}
        plant={selectedPlant}
        isLoading={isSaving}
      />

      <DeletePlantDialog
        isOpen={isDeleteDialogOpen}
        onClose={() => setIsDeleteDialogOpen(false)}
        onConfirm={handleConfirmDelete}
        plant={plantToDelete}
        isLoading={isSaving}
      />

    </div>
  );
};