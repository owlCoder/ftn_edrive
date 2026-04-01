import { Request, Response, Router } from 'express';
import { IAuthService } from '../../Domain/services/auth/IAuthService';
import jwt from "jsonwebtoken";
import { JwtPayload } from '../../Middlewares/authentification/AuthMiddleware';

export class AuthController {
  private router: Router;
  private authService: IAuthService;

  constructor(authService: IAuthService) {
    this.router = Router();
    this.authService = authService;
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    this.router.post('/auth/register', this.register.bind(this));
    this.router.post('/auth/login', this.login.bind(this));
    this.router.post('/auth/logout', this.logout.bind(this));
  }

  private async register(req: Request, res: Response): Promise<void> {
    try {
      const { username, fullName, email, password, profilePicture } = req.body;

      // TODO: Validacija

      const result = await this.authService.register(username, fullName, email, password, profilePicture);

      if (result.id !== 0) {
        const token = jwt.sign(
          { id: result.id, username: result.username, email: result.email, role: result.role } as JwtPayload,
          process.env.JWT_SECRET ?? "",
          { expiresIn: '6h' }
        );
        res.status(201).json({ success: true, message: 'Registration successful', data: { token, user: result } });
      } else {
        res.status(400).json({ success: false, message: 'Registration failed. Username or email already exists.' });
      }
    } catch (error) {
      console.error('Register error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async login(req: Request, res: Response): Promise<void> {
    try {
      const { usernameOrEmail, password } = req.body;

      // TODO: Validacija

      const result = await this.authService.login(usernameOrEmail, password);

      if (result.id !== 0) {
        const token = jwt.sign(
          { id: result.id, username: result.username, email: result.email, role: result.role } as JwtPayload,
          process.env.JWT_SECRET ?? "",
          { expiresIn: '6h' }
        );
        res.status(200).json({ success: true, message: 'Login successful', data: { token, user: result } });
      } else {
        res.status(401).json({ success: false, message: 'Invalid username/email or password' });
      }
    } catch (error) {
      console.error('Login error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async logout(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user?.id;
      const ipAddress = req.ip || req.socket.remoteAddress || '';

      if (!userId) {
        res.status(401).json({ success: false, message: 'Unauthorized' });
        return;
      }

      const success = await this.authService.logout(userId, ipAddress);
      if (success) {
        res.status(200).json({ success: true, message: 'Logout successful' });
      } else {
        res.status(500).json({ success: false, message: 'Logout failed' });
      }
    } catch (error) {
      console.error('Logout error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}