import React from 'react';
import Navbar from '../navigation/Navbar';

function PrivacyPolicy() {
    return (
        <main className="dark:bg-gray-900 bg-gray-100 dark:text-white min-h-screen pb-2">
            <Navbar />
            <div className="pt-4 md:pt-6 mb-4 mt-20 md:mt-20 mx-6 px-6 pb-4 md:mx-20 bg-white border border-gray-200 rounded-lg shadow-sm 2xl:col-span-2 dark:border-gray-900 sm:p-6 dark:bg-gray-800">
                <div className="min-h-screen">
                    <div className="container mx-auto">
                        <h1 className="text-4xl font-semibold mb-4">Privacy Policy</h1> {/* Increased text size */}
                        <p className="text-lg text-primary"> {/* Increased text size */}
                            Welcome to "eBordy"! Your privacy is important to us, and this Privacy Policy explains how we collect, use, and protect your personal information when you use our website and services.
                        </p>
                        <p className="text-lg text-primary"> {/* Increased text size */}
                            By using "eBordy," you agree to the practices described in this Privacy Policy. Please read this document carefully to understand how we handle your information.
                        </p>

                        <h2 className="text-xl font-semibold mt-8">Information We Collect</h2>
                        <p className="text-md text-primary">
                            We may collect various types of information, which may include:
                        </p>
                        <ul className="text-md text-primary">
                            <li>Your name</li>
                            <li>Your email address</li>
                            <li>Information you provide voluntarily</li>
                            <li>Information automatically collected, such as IP address, browser type, and device information</li>
                        </ul>

                        <h2 className="text-xl font-semibold mt-8">How We Use Your Information</h2>
                        <p className="text-md text-primary">
                            We use your information for a range of purposes, including:
                        </p>
                        <ul className="text-md text-primary">
                            <li>Providing, maintaining, and improving our services</li>
                            <li>Communicating with you, including responding to inquiries and requests</li>
                            <li>Customizing your experience on our platform</li>
                        </ul>

                        <h2 className="text-xl font-semibold mt-8">Sharing Your Information</h2>
                        <p className="text-md text-primary">
                            We do not share your personal information with third parties, except as required by law or as necessary to provide our services. We value your privacy and take steps to protect your data.
                        </p>

                        <h2 className="text-xl font-semibold mt-8">Security</h2>
                        <p className="text-md text-primary">
                            We employ reasonable security measures to protect your information. However, it's essential to understand that no online transmission or storage method is entirely secure.
                        </p>

                        <h2 className="text-xl font-semibold mt-8">Cookies and Tracking Technologies</h2>
                        <p className="text-md text-primary">
                            Our website may use cookies and similar tracking technologies to enhance your experience and provide personalized content. You can manage cookie preferences through your browser settings.
                        </p>

                        <h2 className="text-xl font-semibold mt-8">Third-Party Links</h2>
                        <p className="text-md text-primary">
                            Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of those websites. We encourage you to review their privacy policies.
                        </p>

                        <h2 className="text-xl font-semibold mt-8">Changes to This Policy</h2>
                        <p className="text-md text-primary">
                            We may update our Privacy Policy to reflect changes in our practices or for legal reasons. Any updates will be posted on this page. We recommend periodically reviewing this policy for any changes.
                        </p>

                        <h2 className="text-xl font-semibold mt-8">Contact Us</h2>
                        <p className="text-md text-primary">
                            If you have any questions about our Privacy Policy or how we handle your information, please contact us at support@ebordy.com.
                        </p>

                        <p className="mt-8 font-bold">
                            This Privacy Policy was last updated on 05.11.2023. It is effective from 01.01.2024.
                        </p>
                    </div>
                </div>
            </div>
        </main>
    );
}

export default PrivacyPolicy;