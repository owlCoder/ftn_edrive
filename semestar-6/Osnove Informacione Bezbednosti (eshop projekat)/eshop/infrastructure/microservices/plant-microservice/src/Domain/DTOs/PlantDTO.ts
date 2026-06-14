import { PlantStatus } from "../enums/PlantStatus";

export interface PlantDTO {
  id?: number;
  commonName: string;
  latinName: string;
  aromaticOilStrength: number; // 1.0 to 5.0
  countryOfOrigin: string;
  status: PlantStatus;
}