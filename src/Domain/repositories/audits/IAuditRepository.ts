import { Audit } from "../../models/Audit";

export interface IAuditRepository {
    create(audit: Audit): Promise<Audit>;
    getById(id: number): Promise<Audit>;
    getAll(limit?: number, offset?: number): Promise<Audit[]>;
    getByUserId(userId: number): Promise<Audit[]>;
}