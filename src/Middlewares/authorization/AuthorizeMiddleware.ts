import { Request, Response, NextFunction } from "express";

export const authorize = (...allowedRoles: ('player' | 'admin')[]) => {
  return (req: Request, res: Response, next: NextFunction): void => {
    const user = req.user;

    if (!user || !allowedRoles.includes(user.role)) {
      res.status(403).json({ success: false, message: "Zabranjen pristup" });
      return;
    }

    next();
  };
};