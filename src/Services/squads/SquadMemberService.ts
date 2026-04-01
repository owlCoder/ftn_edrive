import { SquadMemberDto } from "../../Domain/DTOs/squads/SquadMemberDto";
import { SquadMember } from "../../Domain/models/SquadMember";
import { ISquadMemberRepository } from "../../Domain/repositories/squads/ISquadMemberRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";
import { ISquadMemberService } from "../../Domain/services/squads/ISquadMemberService";

export class SquadMemberService implements ISquadMemberService {
  public constructor(
    private squadMemberRepository: ISquadMemberRepository,
    private auditService: IAuditService
  ) {}

  async addMember(squadId: number, userCharacterId: number): Promise<SquadMemberDto> {
    // Provera da li već postoji
    const exists = await this.squadMemberRepository.existsInSquad(squadId, userCharacterId);
    if (exists) return new SquadMemberDto();

    const member = new SquadMember(0, squadId, userCharacterId);
    const created = await this.squadMemberRepository.create(member);
    if (created.id === 0) return new SquadMemberDto();

    await this.auditService.create({
      userId: null,
      action: 'SQUAD_MEMBER_ADD',
      details: `Added user character ${userCharacterId} to squad ${squadId}`,
      ipAddress: ''
    });

    return new SquadMemberDto(
      created.id, created.squadId, created.userCharacterId,
      created.createdAt
    );
  }

  async removeMember(id: number): Promise<boolean> {
    const deleted = await this.squadMemberRepository.delete(id);
    if (deleted) {
      await this.auditService.create({
        userId: null,
        action: 'SQUAD_MEMBER_REMOVE',
        details: `Removed member ${id} from squad`,
        ipAddress: ''
      });
    }
    return deleted;
  }

  async getMembersBySquad(squadId: number): Promise<SquadMemberDto[]> {
    const members = await this.squadMemberRepository.getAllBySquadId(squadId);
    return members.map(m => new SquadMemberDto(
      m.id, m.squadId, m.userCharacterId, m.createdAt
    ));
  }

  async clearSquadMembers(squadId: number): Promise<boolean> {
    const cleared = await this.squadMemberRepository.deleteBySquadId(squadId);
    if (cleared) {
      await this.auditService.create({
        userId: null,
        action: 'SQUAD_MEMBERS_CLEAR',
        details: `Cleared all members from squad ${squadId}`,
        ipAddress: ''
      });
    }
    return cleared;
  }

  async countMembers(squadId: number): Promise<number> {
    return await this.squadMemberRepository.countMembers(squadId);
  }
}