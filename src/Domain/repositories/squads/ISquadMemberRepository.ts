import { SquadMember } from "../../models/SquadMember";

export interface ISquadMemberRepository {
    create(member: SquadMember): Promise<SquadMember>;
    getById(id: number): Promise<SquadMember>;
    getAllBySquadId(squadId: number): Promise<SquadMember[]>;
    delete(id: number): Promise<boolean>;
    deleteBySquadId(squadId: number): Promise<boolean>;
    // provera da li odred već sadrži dati user_character
    existsInSquad(squadId: number, userCharacterId: number): Promise<boolean>;
    // broj članova odreda
    countMembers(squadId: number): Promise<number>;
}