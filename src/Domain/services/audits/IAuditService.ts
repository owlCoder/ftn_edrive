import { AuditDto } from "../../DTOs/audits/AuditDto";

export interface IAuditService {
  create(data: Omit<AuditDto, 'id' | 'createdAt'>): Promise<AuditDto>;
  getAuditById(id: number): Promise<AuditDto>;
  getAllAudits(limit?: number, offset?: number): Promise<AuditDto[]>;
  getAuditsByUser(userId: number): Promise<AuditDto[]>;
}