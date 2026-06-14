import { React } from "react";

export const Footer = () => {
    return (
        <footer className="bg-white dark:bg-slate-800 rounded-xl mx-8 my-8 md:mx-32 md:my-12 shadow-lg">
            <div className="mx-auto w-full max-w-screen-xl p-4 py-6 lg:py-8">
                <div className="md:flex md:justify-between">
                    <div className="mb-6 md:mb-0">
                        <a href="/" className="flex items-center">
                            <img src="/logo512.png" className="h-8 mr-3" alt="FlowBite Logo" />
                            <span className="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">eBordy</span>
                        </a>
                    </div>
                    <div className="grid grid-cols-1 gap-8 sm:gap-6 sm:grid-cols-3">
                        <div>
                            <h2 className="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Resources</h2>
                            <ul className="text-gray-500 dark:text-gray-400 font-medium">
                                <li className="mb-4">
                                    <a href="/store" className="hover:underline">Store</a>
                                </li>
                                <li>
                                    <a href="/support" className="hover:underline">Support</a>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h2 className="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Follow us</h2>
                            <ul className="text-gray-500 dark:text-gray-400 font-medium">
                                <li className="mb-4">
                                    <a href="https://github.com/Vukajlo01/Osnove-informacione-bezbednosti" className="hover:underline ">Github</a>
                                </li>
                                <li>
                                    <a href="https://discord.gg/" className="hover:underline">Discord</a>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <h2 className="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Legal</h2>
                            <ul className="text-gray-500 dark:text-gray-400 font-medium">
                                <li className="mb-4">
                                    <a href="/legal/privacy-policy" className="hover:underline">Privacy Policy</a>
                                </li>
                                <li>
                                    <a href="/legal/terms-conditions" className="hover:underline">Terms of Use</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <hr className="my-4 border-gray-200 sm:mx-auto dark:border-slate-400 lg:my-6" />
                <div className="text-center">
                    <span className="text-gray-500 sm:text-center text-center dark:text-gray-400">© 2023 <a href="/" className="hover:underline">eBordy™</a> All Rights Reserved
                    </span>
                </div>
            </div>
        </footer>
    );
};