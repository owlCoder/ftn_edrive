import { AuditDto } from "../../Domain/DTOs/audits/AuditDto";
import { Audit } from "../../Domain/models/Audit";
import { IAuditRepository } from "../../Domain/repositories/audits/IAuditRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";

export class AuditService implements IAuditService {
  public constructor(private auditRepository: IAuditRepository) {}

  async create(data: Omit<AuditDto, 'id' | 'createdAt'>): Promise<AuditDto> {
    const audit = new Audit(
      0,
      data.userId,
      data.action,
      data.details,
      data.ipAddress
    );
    const created = await this.auditRepository.create(audit);
    if (created.id === 0) return new AuditDto();
    return new AuditDto(
      created.id, created.userId, created.action,
      created.details, created.ipAddress, created.createdAt
    );
  }

  async getAuditById(id: number): Promise<AuditDto> {
    const audit = await this.auditRepository.getById(id);
    if (audit.id === 0) return new AuditDto();
    return new AuditDto(
      audit.id, audit.userId, audit.action,
      audit.details, audit.ipAddress, audit.createdAt
    );
  }

  async getAllAudits(limit: number = 100, offset: number = 0): Promise<AuditDto[]> {
    const audits = await this.auditRepository.getAll(limit, offset);
    return audits.map(a => new AuditDto(
      a.id, a.userId, a.action, a.details, a.ipAddress, a.createdAt
    ));
  }

  async getAuditsByUser(userId: number): Promise<AuditDto[]> {
    const audits = await this.auditRepository.getByUserId(userId);
    return audits.map(a => new AuditDto(
      a.id, a.userId, a.action, a.details, a.ipAddress, a.createdAt
    ));
  }
}