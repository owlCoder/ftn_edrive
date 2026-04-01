export class User {
    constructor(
        public id: number = 0,
        public username: string = '',
        public fullName: string = '',
        public email: string = '',
        public passwordHash: string = '',
        public role: 'player' | 'admin' = 'player',
        public profilePicture: string = '',
        public createdAt: Date = new Date(),
        public updatedAt: Date = new Date()
    ) {}
}