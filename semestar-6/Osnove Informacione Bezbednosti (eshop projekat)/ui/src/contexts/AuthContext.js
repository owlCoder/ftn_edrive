import { createContext, useContext, useState, useEffect } from "react";
import { createUserWithEmailAndPassword, sendEmailVerification, signInWithEmailAndPassword, sendPasswordResetEmail } from "firebase/auth";
import { auth } from "../config/firebase";
import axios from "axios";

const AuthContext = createContext();

export function useAuth() {
  return useContext(AuthContext);
}

export function AuthProvider({ children }) {
  const [currentUser, setCurrentUser] = useState();
  const [loading, setLoading] = useState(true);

  // LOGIN FUNCTION
  async function login(email, password) {
    try {
      await signInWithEmailAndPassword(auth, email, password);

      // check is an email verified
      if (auth && auth.currentUser.emailVerified === false) {
        var token = await auth.currentUser.getIdToken();

        // log unsuccesfull login attempt
        await axios.post(
          global.APIEndpoint + "/api/audit/create",
          {
            messageType: "WARNING",
            message: "User [email: " + email + "] tried to login system without verified email"
          },
          {
            headers:
            {
              Authorization: `${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        await signOut();
        setCurrentUser(null);

        return {
          code: 401,
          response: "Email has not been verified"
        };
      }
      else if (auth != null && auth.currentUser.emailVerified === true) {
        const token = await auth.currentUser.getIdToken();

        // log succesfull login
        await axios.post(
          global.APIEndpoint + "/api/audit/create",
          {
            messageType: "INFO",
            message: "User [email: " + email + "] logged in"
          },
          {
            headers:
            {
              Authorization: `${token}`,
              "Content-Type": "application/json"
            }
          });

        return {
          code: 200,
          response: "OK"
        };
      }
    }
    catch (error) {
      console.warn(error);
      if (error.code === "auth/invalid-credential") {
        return {
          code: 401,
          response: "The information you entered is incorrect or account doesn't exist"
        };
      }
      else if (error.code === "auth/invalid-login-credentials") {
        return {
          code: 401,
          response: "The information you entered is incorrect or account doesn't exist"
        };
      }
      else if (error.code === "auth/user-disabled") {
        await axios.post(
          global.APIEndpoint + "/api/audit/create",
          {
            messageType: "INFO",
            message: "User [email: " + email + "] tried to access with disabled account"
          },
          {
            headers:
            {
              Authorization: `${token}`,
              "Content-Type": "application/json"
            }
          });
        return {
          code: 403,
          response: "Your account has been disabled by an administrator"
        };
      }
      else if (error.code === "auth/invalid-email") {
        return {
          code: 401,
          response: "The email is not in a valid format"
        };
      }
      else if (error.code === "auth/user-not-found") {
        return {
          code: 400,
          response: "We don't have your account registered"
        };
      }
      else if (error.code === "auth/too-many-requests") {
        // log suspisious activity
        await axios.post(
          global.APIEndpoint + "/api/audit/create",
          {
            messageType: "WARNING",
            message: "Another user [using email: " + email + "] tried to access the system with another account"
          },
          {
            headers:
            {
              Authorization: `${token}`,
              "Content-Type": "application/json"
            }
          });
        return {
          code: 401,
          response: "Too many failed login attempts. Try again later"
        };
      }
      else {
        // log internal error
        await axios.post(
          global.APIEndpoint + "/api/audit/create",
          {
            messageType: "ERROR",
            message: error.message
          },
          {
            headers:
            {
              Authorization: `${token}`,
              "Content-Type": "application/json",
            },
          }
        );
      }

      console.log("greskica")
      console.log("wrong")
    }
  }

  // REGISTER FUNCTION
  async function register(email, password, firstName, lastName, date) {
    try {
      await createUserWithEmailAndPassword(auth, email, password);
      await sendEmailVerification(auth.currentUser);
      let uid = auth.currentUser.uid;
      var token = await auth.currentUser.getIdToken();

      // call api to create a new user in firestore
      const response = await axios.post(
        global.APIEndpoint + "/api/user/create",
        {
          uid: uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          date: date,
        },
        {
          headers:
          {
            Authorization: `${token}`,
            "Content-Type": "application/json",
          },
        }
      );

      await signOut(); // sign out user, to make verify email possible

      if (response.status === 200)
        return {
          response: "A verification email has been sent to your email address."
        };
      else
        return {
          response: response.data.payload
        };

    }
    catch (error) {
      if (error.code === "auth/weak-password")
        return {
          code: 400,
          response: "The password must have a minimum length of 6"
        };
      else if (error.code === "auth/email-already-in-use")
        return {
          code: 400,
          response: "The email is taken by another user"
        };
      else if (error.code === "auth/invalid-email")
        return {
          code: 400,
          response: "The email is not in a valid format"
        };
      else if (error.code === "auth/operation-not-allowed")
        return {
          code: 400,
          response: "Registration is temporary unavailable"
        };
      else {
        await axios.post(
          global.APIEndpoint + "/api/audit/create",
          {
            messageType: "ERROR",
            message: error.message
          },
          {
            headers:
            {
              Authorization: `${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        return {
          code: 500,
          response: "An unknown error has occurred. Try again later"
        };
      }
    }
  }

  // SIGN OUT FUNCTION
  async function signOut() {
    try {
      var token = await auth.currentUser.getIdToken();

      // log user sign out
      await axios.post(
        global.APIEndpoint + "/api/audit/create",
        {
          messageType: "INFO",
          message: "User [email: " + auth.currentUser.email + "] logged out"
        },
        {
          headers:
          {
            Authorization: `${token}`,
            "Content-Type": "application/json"
          }
        });

      await auth.signOut();
      setCurrentUser(null);
      localStorage.clear();
      return {
        code: 200,
        response: "success"
      };
    }
    catch (error) {
      await axios.post(
        global.APIEndpoint + "/api/audit/create",
        {
          messageType: "ERROR",
          message: error.message
        },
        {
          headers:
          {
            Authorization: `${token}`,
            "Content-Type": "application/json",
          },
        }
      );
      return {
        code: 500,
        response: error.message
      };
    }
  }

  // RESET PASSWORD FUNCTION
  async function resetPasswordEmail(email) {
    try {
      await sendPasswordResetEmail(auth, email);
      return {
        code: 200,
        response: "Password reset email has been sent."
      };
    }
    catch (error) {
      return {
        code: 400,
        response: "Invalid email has been entered.",
      };
    }
  }

  // RESET PASSWORD FUNCTION
  async function resetPasswordEmailUser(email) {
    try {
      var token = await auth.currentUser.getIdToken();
      await sendPasswordResetEmail(auth, email);
      await axios.post(
        global.APIEndpoint + "/api/audit/create",
        {
          messageType: "INFO",
          message: "User [email: " + email + "] has request a password reset"
        },
        {
          headers:
          {
            Authorization: `${token}`,
            "Content-Type": "application/json",
          },
        }
      );
      return {
        code: 200,
        response: "Password reset email has been sent."
      };
    }
    catch (error) {
      await axios.post(
        global.APIEndpoint + "/api/audit/create",
        {
          messageType: "ERROR",
          message: error.message
        },
        {
          headers:
          {
            Authorization: `${token}`,
            "Content-Type": "application/json",
          },
        }
      );

      return {
        code: 400,
        response: "Invalid Email has been entered.",
      };
    }
  }

  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged((user) => {
      setCurrentUser(user);
      setLoading(false);
    });

    return unsubscribe;
  }, []);

  const value = {
    currentUser,
    login,
    register,
    signOut,
    resetPasswordEmail,
    resetPasswordEmailUser
  };

  return (
    <AuthContext.Provider value={value}>
      {!loading && children}
    </AuthContext.Provider>
  );
}
