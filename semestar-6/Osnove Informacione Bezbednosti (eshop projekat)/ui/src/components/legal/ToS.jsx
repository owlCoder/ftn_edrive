import React from 'react';
import Navbar from '../navigation/Navbar';

function TermsOfService() {
  return (
    <main className="dark:bg-gray-900 bg-gray-100 dark:text-white min-h-screen pb-2">
      <Navbar />
      <div className="pt-4 md:pt-6 mb-4 mt-20 md:mt-20 mx-6 px-6 pb-4 md:mx-20 bg-white border border-gray-200 rounded-lg shadow-sm 2xl:col-span-2 dark:border-gray-900 sm:p-6 dark:bg-gray-800">
        <div className="container mx-auto">
          <h1 className="text-4xl font-semibold mb-8">Terms of Service</h1>
          <p className="text-lg text-primary">
            Welcome to "eBordy"! Please read these Terms of Service carefully before using our website or services.
          </p>
          <p className="text-lg text-primary">
            By using "eBordy," you agree to the following terms and conditions. If you do not agree with these terms, please do not use our services.
          </p>

          <h2 className="text-xl font-semibold mt-8">Use of Our Services</h2>
          <p className="text-md text-primary">
            You must use "eBordy" in compliance with these Terms of Service and all applicable laws and regulations. Unauthorized use or any violation of these terms may result in the termination of your account.
          </p>

          <h2 className="text-xl font-semibold mt-8">User Accounts</h2>
          <p className="text-md text-primary">
            When you create an account with us, you are responsible for maintaining the confidentiality of your account information. You agree to notify us immediately of any unauthorized use of your account.
          </p>

          <h2 className="text-xl font-semibold mt-8">Intellectual Property</h2>
          <p className="text-md text-primary">
            The content and materials provided on "eBordy," including text, graphics, logos, images, and software, are the property of "eBordy" and protected by intellectual property laws. You may not use, modify, or distribute our content without our express written consent.
          </p>

          <h2 className="text-xl font-semibold mt-8">Limitation of Liability</h2>
          <p className="text-md text-primary">
            "eBordy" is provided on an "as is" and "as available" basis. We are not liable for any damages or losses that may arise from your use of our services.
          </p>

          <h2 className="text-xl font-semibold mt-8">Privacy</h2>
          <p className="text-md text-primary">
            Your use of "eBordy" is also governed by our Privacy Policy, which outlines how we collect, use, and protect your information. Please review our Privacy Policy for more details.
          </p>

          <h2 className="text-xl font-semibold mt-8">Changes to These Terms</h2>
          <p className="text-md text-primary">
            We may update these Terms of Service to reflect changes in our services or for legal reasons. Any updates will be posted on this page. We recommend periodically reviewing these terms for any changes.
          </p>

          <h2 className="text-xl font-semibold mt-8">Contact Us</h2>
          <p className="text-md text-primary">
            If you have any questions or concerns about our Terms of Service or our services, please contact us at support@ebordy.com.
          </p>

          <p className="mt-8 font-bold">
            These Terms of Service were last updated on 05.11.2023.
          </p>
        </div>
      </div>
    </main>
  );
}

export default TermsOfService;
