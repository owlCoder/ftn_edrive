import { Repository } from "typeorm";
import { IPlantsService } from "../Domain/services/IPlantsService";
import { Plant } from "../Domain/models/Plant";
import { PlantDTO } from "../Domain/DTOs/PlantDTO";

export class PlantsService implements IPlantsService {
  constructor(private readonly plantRepository: Repository<Plant>) {}

  /** Get all plants */
  async getAllPlants(): Promise<PlantDTO[]> {
    const plants = await this.plantRepository.find();
    return plants.map((plant) => this.toDTO(plant));
  }

  /** Get a single plant by ID */
  async getPlantById(id: number): Promise<PlantDTO> {
    const plant = await this.plantRepository.findOne({ where: { id } });
    if (!plant) throw new Error(`Plant with ID ${id} not found`);
    return this.toDTO(plant);
  }

  /** Create a new plant */
  async createPlant(plant: Plant): Promise<PlantDTO> {
    const newPlant = this.plantRepository.create(plant);
    const savedPlant = await this.plantRepository.save(newPlant);
    return this.toDTO(savedPlant);
  }

  /** Update existing plant */
  async updatePlant(id: number, plant: Plant): Promise<PlantDTO> {
    const existingPlant = await this.plantRepository.findOne({ where: { id } });
    if (!existingPlant) throw new Error(`Plant with ID ${id} not found`);

    const updated = { ...existingPlant, ...plant };
    const savedPlant = await this.plantRepository.save(updated);
    return this.toDTO(savedPlant);
  }

  /** Delete a plant */
  async deletePlant(id: number): Promise<boolean> {
    const result = await this.plantRepository.delete(id);
    return result.affected !== undefined && result.affected !== null && result.affected > 0;
  }

  /** Convert Plant entity to PlantDTO */
  private toDTO(plant: Plant): PlantDTO {
    return {
      id: plant.id ?? 0,
      commonName: plant.commonName,
      latinName: plant.latinName,
      aromaticOilStrength: plant.aromaticOilStrength,
      countryOfOrigin: plant.countryOfOrigin,
      status: plant.status,
    };
  }
}
