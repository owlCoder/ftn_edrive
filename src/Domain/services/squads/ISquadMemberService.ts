import { SquadMemberDto } from "../../DTOs/squads/SquadMemberDto";

export interface ISquadMemberService {
  addMember(squadId: number, userCharacterId: number): Promise<SquadMemberDto>;
  removeMember(id: number): Promise<boolean>;
  getMembersBySquad(squadId: number): Promise<SquadMemberDto[]>;
  clearSquadMembers(squadId: number): Promise<boolean>;
  countMembers(squadId: number): Promise<number>;
}