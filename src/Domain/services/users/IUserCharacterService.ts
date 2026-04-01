import { UserCharacterDto } from "../../DTOs/characters/UserCharacterDto";

export interface IUserCharacterService {
  addCharacterToCollection(userId: number, characterId: number, data: Omit<UserCharacterDto, 'id' | 'userId' | 'characterId' | 'createdAt' | 'updatedAt'>): Promise<UserCharacterDto>;
  getUserCollection(userId: number): Promise<UserCharacterDto[]>;
  getUserCharacterById(id: number): Promise<UserCharacterDto>;
  updateUserCharacter(id: number, data: Partial<UserCharacterDto>): Promise<UserCharacterDto>;
  removeFromCollection(id: number): Promise<boolean>;
}