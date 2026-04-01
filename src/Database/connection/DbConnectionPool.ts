import mysql, { Pool, PoolOptions } from "mysql2/promise";
import dotenv from "dotenv";

dotenv.config();

// Helper funkcija za validaciju obaveznih env varijabli
function requireEnv(name: string): string {
  const value = process.env[name];
  if (!value) {
    throw new Error(`Missing required environment variable: ${name}`);
  }
  return value;
}

// Konfiguracija baze sa podrazumevanim vrednostima
const dbConfig: PoolOptions = {
  host: requireEnv("DB_HOST"),
  user: requireEnv("DB_USER"),
  password: requireEnv("DB_PASSWORD"),
  database: requireEnv("DB_NAME"),
  port: Number(process.env.DB_PORT) || 3306,
  waitForConnections: true,
  connectionLimit: 10,           // maksimalan broj konekcija u pool-u
  queueLimit: 0,                 // neograničen red čekanja
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
  // SSL opcioni – ako je postavljen env SSL_CA
  ...(process.env.SSL_CA && {
    ssl: {
      ca: process.env.SSL_CA,
      rejectUnauthorized: process.env.SSL_REJECT_UNAUTHORIZED !== "false",
    },
  }),
};

const pool: Pool = mysql.createPool(dbConfig);

// Provera konekcije pre nego što se aplikacija pokrene
(async () => {
  try {
    const connection = await pool.getConnection();
    console.log(`[Server]: Successfully connected to database ${dbConfig.database} on ${dbConfig.host}:${dbConfig.port}`);
    connection.release();
  } catch (error) {
    console.error("[Server]: Failed to connect to database:", error);
    process.exit(1);
  }
})();

// Logovanje grešaka koje se dese na nivou pool-a (opciono)
(pool as any).on("error", (err: Error) => {
  console.error("[Server]: Unexpected error on idle client", err);
  process.exit(1);
});

export default pool;