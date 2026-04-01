import { SquadDto } from "../../DTOs/squads/SquadDto";

export interface ISquadService {
  createSquad(userId: number, name: string): Promise<SquadDto>;
  getSquadById(id: number): Promise<SquadDto>;
  getUserSquads(userId: number): Promise<SquadDto[]>;
  updateSquad(id: number, name: string): Promise<SquadDto>;
  deleteSquad(id: number): Promise<boolean>;
}