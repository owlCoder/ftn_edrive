import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import { useAuth } from "../../contexts/AuthContext";
import ImagePicker from '../randImg/randomImage'
import { RiLockPasswordLine } from 'react-icons/ri';

export default function ForgotPassword() {
  const [email, setEmail] = useState("");

  const navigate = useNavigate();
  const { currentUser, resetPasswordEmail } = useAuth();
  const [loading, setLoading] = useState(false);

  const [response, setResponse] = useState("");
  const [error, setError] = useState("");

  useEffect(() => {

  }, [currentUser, navigate]);

  async function handleFormSubmit(e) {
    e.preventDefault();
    setLoading(true);
    let res = await resetPasswordEmail(email);
    setResponse(res.response);
    setError(res.code);
    setLoading(false);
  }

  return (

    <section className="flex flex-col md:flex-row h-screen items-center bg-white dark:bg-gray-900 text-slate-600 dark:text-slate-100">

      {/* Image */}
      <div className="bg-white dark:bg-gray-900 hidden lg:block w-full md:w-1/2 xl:w-2/3 h-screen">
        <ImagePicker />
      </div>

      {/* Content */}
      <div className="relative w-full md:max-w-md lg:max-w-full md:mx-auto md:w-1/2 xl:w-1/3 h-screen px-6 lg:px-16 xl:px-12
        flex items-center justify-center">

        <div className="w-full h-100">

          {/* Content Title */}
          <h1 className="text-xl md:text-2xl font-bold leading-tight mt-12">Request a password reset</h1>

          {/* Form */}
          <form className="mt-6" onSubmit={handleFormSubmit}>

            {/* Mail */}
            <div>
              <label className="block">Enter your email and we'll send you instructions on how to reset your password.</label>
              <input type="email" name="email" id="email" onChange={(e) => setEmail(e.target.value)} placeholder="Enter Email Address" className="w-full px-4 py-3 rounded-lg bg-gray-50 mt-2 border border-slate-500 focus:border-blue-500 focus:bg-white focus:outline-none dark:bg-gray-900 dark:focus:bg-gray-800" autoComplete="email" required />
            </div>

            {/* Error Message */}
            <div>
              {error !== "200" ?  <h4 className="text-green-700 dark:text-green-400 mt-4 mb-5">{response}</h4> :  <h4 className="text-red-700 dark:text-red-400 mt-4 mb-5">{response}</h4>}
            </div>

            {/* Reset Password */}
            <button type="submit" className="flex flex-row items-center justify-center w-full text-white bg-blue-700 hover:bg-blue-800 font-semibold rounded-lg
              px-4 py-3 mt-6">{loading ? <div><svg aria-hidden="true" role="status" className="inline w-4 h-4 mr-3 text-white animate-spin" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#E5E7EB" />
              <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentColor" />
            </svg></div> : ""}
                RESET PASSWORD <RiLockPasswordLine className="plus-icon inline ml-2 text-xl" /></button>
          </form>

          <hr className="my-6 border-slate-500 w-full" />

          {/* Create Account Link */}
          <p className="mt-8">Back to <a href="/login" className="text-blue-500 hover:text-blue-700 font-semibold">Log In</a></p>

          {/* Back Button */}
          <a href="/">
            <div className="group absolute top-5 left-4 flex items-center justify-center w-12 h-12 bg-gray-200 rounded-full md:bg-white md:top-4 hover:cursor-pointer hover:-translate-y-0.5      transition duration-150">
              <a href="/" className="text-gray-900 text-5xl -mt-3 -ml-1 font-normal">‹</a>
            </div>
          </a>

        </div>
      </div>
    </section>
  );
}