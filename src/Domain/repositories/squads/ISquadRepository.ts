import { Squad } from "../../models/Squad";

export interface ISquadRepository {
    create(squad: Squad): Promise<Squad>;
    getById(id: number): Promise<Squad>;
    getAllByUserId(userId: number): Promise<Squad[]>;
    update(squad: Squad): Promise<Squad>;
    delete(id: number): Promise<boolean>;
    exists(id: number): Promise<boolean>;
}