import express, { Application, Request, Response, NextFunction } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { AuthController } from './WebAPI/controllers/AuthController';
import { UserController } from './WebAPI/controllers/UserController';
import { CharacterController } from './WebAPI/controllers/CharacterController';
import { CollectionController } from './WebAPI/controllers/CollectionController';
import { SquadController } from './WebAPI/controllers/SquadController';
import { AuditController } from './WebAPI/controllers/AuditController';

// Interfejsi repozitorijuma
import { IUserRepository } from './Domain/repositories/users/IUserRepository';
import { ICharacterRepository } from './Domain/repositories/characters/ICharacterRepository';
import { IUserCharacterRepository } from './Domain/repositories/characters/IUserCharacterRepository';
import { ISquadRepository } from './Domain/repositories/squads/ISquadRepository';
import { ISquadMemberRepository } from './Domain/repositories/squads/ISquadMemberRepository';
import { IAuditRepository } from './Domain/repositories/audits/IAuditRepository';

// Interfejsi servisa
import { IAuthService } from './Domain/services/auth/IAuthService';
import { IUserService } from './Domain/services/users/IUserService';
import { ICharacterService } from './Domain/services/characters/ICharacterService';
import { IUserCharacterService } from './Domain/services/users/IUserCharacterService';
import { ISquadService } from './Domain/services/squads/ISquadService';
import { ISquadMemberService } from './Domain/services/squads/ISquadMemberService';
import { IAuditService } from './Domain/services/audits/IAuditService';

// Implementacije repozitorijumaServices
import { UserRepository } from './Database/repositories/users/UserRepository';
import { CharacterRepository } from './Database/repositories/characters/CharacterRepository';
import { UserCharacterRepository } from './Database/repositories/characters/UserCharacterRepository';
import { SquadRepository } from './Database/repositories/squads/SquadRepository';
import { SquadMemberRepository } from './Database/repositories/squads/SquadMemberRepository';
import { AuditRepository } from './Database/repositories/audits/AuditRepository';

// Implementacije servisa
import { AuthService } from './Services/auth/AuthService';
import { UserService } from './Services/users/UserService';
import { CharacterService } from './Services/characters/CharacterService';
import { UserCharacterService } from './Services/users/UserCharacterService';
import { SquadService } from './Services/squads/SquadService';
import { SquadMemberService } from './Services/squads/SquadMemberService';
import { AuditService } from './Services/audits/AuditService';

dotenv.config();

const app: Application = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors({ origin: "*" })); // dozvoljava pristup bilo kog klijenta
app.use(express.json({ limit: '10mb' }));  // za base64 slike
app.use(express.urlencoded({ extended: true }));

// Inicijalizacija repozitorijuma (levo interfejs, desno implementacija)
const userRepository: IUserRepository = new UserRepository();
const characterRepository: ICharacterRepository = new CharacterRepository();
const userCharacterRepository: IUserCharacterRepository = new UserCharacterRepository();
const squadRepository: ISquadRepository = new SquadRepository();
const squadMemberRepository: ISquadMemberRepository = new SquadMemberRepository();
const auditRepository: IAuditRepository = new AuditRepository();

// Inicijalizacija servisa (levo interfejs, desno implementacija)
const auditService: IAuditService = new AuditService(auditRepository);
const authService: IAuthService = new AuthService(userRepository, auditService);
const userService: IUserService = new UserService(userRepository, auditService);
const characterService: ICharacterService = new CharacterService(characterRepository, auditService);
const userCharacterService: IUserCharacterService = new UserCharacterService(userCharacterRepository, auditService);
const squadService: ISquadService = new SquadService(squadRepository, auditService);
const squadMemberService: ISquadMemberService = new SquadMemberService(squadMemberRepository, auditService);

// Inicijalizacija kontrolera (već primaju interfejse)
const authController = new AuthController(authService);
const userController = new UserController(userService);
const characterController = new CharacterController(characterService);
const collectionController = new CollectionController(userCharacterService);
const squadController = new SquadController(squadService, squadMemberService);
const auditController = new AuditController(auditService);

// Montiranje ruta na /api/v1
app.use('/api/v1', authController.getRouter());
app.use('/api/v1', userController.getRouter());
app.use('/api/v1', characterController.getRouter());
app.use('/api/v1', collectionController.getRouter());
app.use('/api/v1', squadController.getRouter());
app.use('/api/v1', auditController.getRouter());

// Osnovna ruta za proveru statusa
app.get('/health', (req: Request, res: Response) => {
  res.status(200).json({ status: 'OK', timestamp: new Date() });
});

// Middleware za hendlovanje nepostojećih ruta
app.use((req: Request, res: Response) => {
  res.status(404).json({ success: false, message: 'Route not found' });
});

// Globalni handler za greške
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error('Unhandled error:', err);
  res.status(500).json({ success: false, message: 'Internal server error' });
});

export default app;