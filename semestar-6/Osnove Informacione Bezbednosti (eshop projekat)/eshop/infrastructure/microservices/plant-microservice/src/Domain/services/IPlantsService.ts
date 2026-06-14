import { PlantDTO } from "../DTOs/PlantDTO";

export interface IPlantsService {
  getAllPlants(): Promise<PlantDTO[]>;
  getPlantById(id: number): Promise<PlantDTO>;
  createPlant(plant: PlantDTO): Promise<PlantDTO>;
  updatePlant(id: number, plant: PlantDTO): Promise<PlantDTO>;
  deletePlant(id: number): Promise<boolean>;
}
