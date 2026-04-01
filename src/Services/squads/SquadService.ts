import { SquadDto } from "../../Domain/DTOs/squads/SquadDto";
import { Squad } from "../../Domain/models/Squad";
import { ISquadRepository } from "../../Domain/repositories/squads/ISquadRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";
import { ISquadService } from "../../Domain/services/squads/ISquadService";

export class SquadService implements ISquadService {
  public constructor(
    private squadRepository: ISquadRepository,
    private auditService: IAuditService
  ) {}

  async createSquad(userId: number, name: string): Promise<SquadDto> {
    const squad = new Squad(0, userId, name);
    const created = await this.squadRepository.create(squad);
    if (created.id === 0) return new SquadDto();

    await this.auditService.create({
      userId,
      action: 'SQUAD_CREATE',
      details: `Squad ${name} created`,
      ipAddress: ''
    });

    return new SquadDto(
      created.id, created.userId, created.name,
      created.createdAt, created.updatedAt
    );
  }

  async getSquadById(id: number): Promise<SquadDto> {
    const squad = await this.squadRepository.getById(id);
    if (squad.id === 0) return new SquadDto();
    return new SquadDto(
      squad.id, squad.userId, squad.name,
      squad.createdAt, squad.updatedAt
    );
  }

  async getUserSquads(userId: number): Promise<SquadDto[]> {
    const squads = await this.squadRepository.getAllByUserId(userId);
    return squads.map(s => new SquadDto(
      s.id, s.userId, s.name,
      s.createdAt, s.updatedAt
    ));
  }

  async updateSquad(id: number, name: string): Promise<SquadDto> {
    const existing = await this.squadRepository.getById(id);
    if (existing.id === 0) return new SquadDto();

    existing.name = name;
    const updated = await this.squadRepository.update(existing);
    if (updated.id === 0) return new SquadDto();

    await this.auditService.create({
      userId: updated.userId,
      action: 'SQUAD_UPDATE',
      details: `Squad ${updated.name} updated`,
      ipAddress: ''
    });

    return new SquadDto(
      updated.id, updated.userId, updated.name,
      updated.createdAt, updated.updatedAt
    );
  }

  async deleteSquad(id: number): Promise<boolean> {
    const deleted = await this.squadRepository.delete(id);
    if (deleted) {
      await this.auditService.create({
        userId: null,
        action: 'SQUAD_DELETE',
        details: `Squad ${id} deleted`,
        ipAddress: ''
      });
    }
    return deleted;
  }
}