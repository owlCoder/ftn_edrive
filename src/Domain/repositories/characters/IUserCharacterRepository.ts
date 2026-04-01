import { UserCharacter } from "../../models/UserCharacter";

export interface IUserCharacterRepository {
    create(uc: UserCharacter): Promise<UserCharacter>;
    getById(id: number): Promise<UserCharacter>;
    getAllByUserId(userId: number): Promise<UserCharacter[]>;
    getAllByCharacterId(characterId: number): Promise<UserCharacter[]>;
    update(uc: UserCharacter): Promise<UserCharacter>;
    delete(id: number): Promise<boolean>;
    exists(id: number): Promise<boolean>;
    // provera da li korisnik već ima dati heroj u kolekciji
    existsForUserAndCharacter(userId: number, characterId: number): Promise<boolean>;
}