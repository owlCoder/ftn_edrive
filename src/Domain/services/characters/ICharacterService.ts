import { CharacterDto } from "../../DTOs/characters/CharacterDto";

export interface ICharacterService {
  createCharacter(data: Omit<CharacterDto, 'id' | 'createdAt' | 'updatedAt'>): Promise<CharacterDto>;
  getCharacterById(id: number): Promise<CharacterDto>;
  getAllCharacters(): Promise<CharacterDto[]>;
  updateCharacter(id: number, data: Partial<CharacterDto>): Promise<CharacterDto>;
  deleteCharacter(id: number): Promise<boolean>;
  filterCharacters(element?: string, weaponType?: string, rarity?: number): Promise<CharacterDto[]>;
}