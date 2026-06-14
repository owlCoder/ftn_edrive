import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";
import { PlantStatus } from "../enums/PlantStatus";

@Entity({ name: "plants" })
export class Plant {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({ type: "varchar", length: 100 })
  commonName!: string;

  @Column({ type: "varchar", length: 100 })
  latinName!: string;

  @Column({ type: "float", precision: 2 })
  aromaticOilStrength!: number; // 1.0 to 5.0

  @Column({ type: "varchar", length: 100 })
  countryOfOrigin!: string;

  @Column({
    type: "enum",
    enum: PlantStatus,
    default: PlantStatus.PLANTED,
  })
  status!: PlantStatus;
}
