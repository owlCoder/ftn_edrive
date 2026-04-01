import { Request, Response, Router } from "express";
import { authenticate } from "../../Middlewares/authentification/AuthMiddleware";
import { authorize } from "../../Middlewares/authorization/AuthorizeMiddleware";
import { IAuditService } from "../../Domain/services/audits/IAuditService";

export class AuditController {
  private router: Router;
  private auditService: IAuditService;

  constructor(auditService: IAuditService) {
    this.router = Router();
    this.auditService = auditService;
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    this.router.get("/audits/logs", authenticate, authorize("admin"), this.getAllLogs.bind(this));
    this.router.get("/audits/logs/:id", authenticate, authorize("admin"), this.getLogById.bind(this));
    this.router.get("/audits/logs/user/:userId", authenticate, authorize("admin"), this.getLogsByUser.bind(this));
  }

  private async getAllLogs(req: Request, res: Response): Promise<void> {
    try {
      const limit = req.query.limit ? parseInt(req.query.limit as string) : 100;
      const offset = req.query.offset ? parseInt(req.query.offset as string) : 0;

      const logs = await this.auditService.getAllAudits(limit, offset);
      res.status(200).json({ success: true, data: logs });
    } catch (error) {
      console.error('Get all logs error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async getLogById(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid log ID' });
        return;
      }

      const log = await this.auditService.getAuditById(id);
      if (log.id === 0) {
        res.status(404).json({ success: false, message: 'Log not found' });
        return;
      }
      res.status(200).json({ success: true, data: log });
    } catch (error) {
      console.error('Get log by id error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async getLogsByUser(req: Request, res: Response): Promise<void> {
    try {
      const userId = parseInt(req.params.userId as string);
      if (isNaN(userId)) {
        res.status(400).json({ success: false, message: 'Invalid user ID' });
        return;
      }

      const logs = await this.auditService.getAuditsByUser(userId);
      res.status(200).json({ success: true, data: logs });
    } catch (error) {
      console.error('Get logs by user error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}