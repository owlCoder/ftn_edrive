import React, { useState, Fragment, useEffect } from "react";
import { Menu, Transition } from "@headlessui/react";
import { useAuth } from "../../contexts/AuthContext";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { RiSettingsLine } from 'react-icons/ri';
import { LuLayoutDashboard, LuBarChartBig } from 'react-icons/lu';
import { BiSolidExit } from 'react-icons/bi';
import { AiOutlinePlus, AiOutlineUserAdd } from "react-icons/ai"; // Import the plus icon from React Icons
import { FaUser } from "react-icons/fa";
import { BiSolidDownArrow } from 'react-icons/bi';
import { VscAccount } from 'react-icons/vsc';

function classNames(...classes) {
  return classes.filter(Boolean).join(" ");
}

function Navbar() {
  const links = ["Homepage", "Store"];
  const profileLinks = ["Account Settings"];
  const { currentUser, signOut } = useAuth();
  const navigate = useNavigate();
  const [admin, setAdmin] = useState(false);
  const [user, setUser] = useState(false);

  async function handleSignOut(e) {
    e.preventDefault();
    await signOut();
    navigate("/");
  }

  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      if (!currentUser) {
        return;
      }

      try {
        const token = await currentUser.getIdToken();
        const response = await axios.post(
          global.APIEndpoint + "/api/user/getRoleByUid",
          {
            uid: currentUser.uid,
          },
          {
            headers: {
              Authorization: `${token}`,
              "Content-Type": "application/json",
            },
            
          }
        );

        if (response.data != null) {
          if (response.data.payload === "admin")
            setAdmin(true);
          if (response.data.payload === "user")
            setUser(true);
        }

        if (response.status !== 200)
          navigate('/403' + response.status.toString());
      } catch (error) {
        navigate('/403')
      }
    };

    fetchData();
  }, [currentUser, navigate]);

  return (
    <div>
      <nav className="bg-gray-50 dark:bg-gray-950 dark:text-white dark:border-gray-800 fixed top-0 w-full border-b-2 border-gray-200 z-50">
        <div className="mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            <div className="flex items-center">
              <div className="flex-shrink-0 flex items-center">
                <img
                  className="h-8 w-13"
                  src="/logo512.png"
                  alt="Workflow"
                />
                <div className="inline font-medium text-slate-950 dark:text-white">eBordy</div>
              </div>
              <div className="hidden md:block">
                <div className="ml-10 flex items-baseline space-x-4">
                  {links.map((link, index) => (
                    <a
                      href={"/" + link.toLowerCase().replaceAll(" ", "-")}
                      key={index}
                      className="hover:bg-gray-300 px-3 py-2 rounded-md text-sm font-medium dark:hover:bg-gray-800"
                    >
                      {link}
                    </a>
                  ))}
                  {user && (
                    <a href="/new" className="new-ad-button">
                      <AiOutlinePlus className="plus-icon" />
                      New product&nbsp;
                    </a>

                  )}
                  <div className="absolute right-4 text-base font-normal">
                    {currentUser !== null ? (
                      <Menu
                        as="div"
                        className="relative inline-block text-left"
                      >
                        <div>
                          <Menu.Button className="inline-flex w-full justify-center gap-x-1.5 rounded-md px-3 py-2  text-sm font-semibold bg-primary-800 dark:bg-primary-900 hover:bg-blue-800 text-white">
                            <FaUser className="plus-icon inline mt-1" />
                            Welcome, {currentUser.email} <BiSolidDownArrow className="plus-icon inline mt-1.5" style={{ fontSize: 10 }} />
                          </Menu.Button>
                        </div>

                        <Transition
                          as={Fragment}
                          enter="transition ease-out duration-100"
                          enterFrom="transform opacity-0 scale-95"
                          enterTo="transform opacity-100 scale-100"
                          leave="transition ease-in duration-75"
                          leaveFrom="transform opacity-100 scale-100"
                          leaveTo="transform opacity-0 scale-95"
                        >
                          <Menu.Items className="absolute right-0 z-10 mt-2 w-56 origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 dark:bg-gray-800 dark:divide-gray-700 ring-black ring-opacity-5 focus:outline-none">
                            <div className="py-1">
                              <Menu.Item>
                                {({ active }) => (
                                  <a
                                    href="/account-settings"
                                    className={classNames(
                                      active
                                        ? "bg-gray-100 dark:bg-gray-900 text-gray-900"
                                        : "text-gray-700",
                                      "block px-4 py-2 text-sm dark:text-gray-300 dark:hover:bg-gray-900"
                                    )}
                                  >
                                    <RiSettingsLine className="icon inline mr-2 dark:text-white" fontSize="1.2rem" /> Account Settings
                                  </a>
                                )}
                              </Menu.Item>
                            </div>
                            {admin && (
                              <div className="py-1">
                                <Menu.Item>
                                  {({ active }) => (
                                    <a
                                      href="/oib-admin"
                                      className={classNames(
                                        active
                                          ? "bg-gray-100 dark:bg-gray-900 text-gray-900"
                                          : "text-gray-700",
                                        "block px-4 py-2 text-sm dark:text-gray-300 dark:hover:bg-gray-900"
                                      )}
                                    >
                                      <LuLayoutDashboard className="icon inline mr-2 dark:text-white" fontSize="1.2rem" /> Dashboard
                                    </a>
                                  )}
                                </Menu.Item>
                              </div>)}
                            {user && (
                              <div className="py-1">
                                <Menu.Item>
                                  {({ active }) => (
                                    <a
                                      href="/products-orders"
                                      className={classNames(
                                        active
                                          ? "bg-gray-100 dark:bg-gray-900 text-gray-900"
                                          : "text-gray-700",
                                        "block px-4 py-2 text-sm dark:text-gray-300 dark:hover:bg-gray-900"
                                      )}
                                    >
                                      <LuBarChartBig className="icon inline mr-2 dark:text-white" fontSize="1.2rem" /> Products & Orders
                                    </a>
                                  )}
                                </Menu.Item>
                              </div>)}
                            <div className="py-1">
                              <Menu.Item>
                                {({ active }) => (
                                  <a
                                    href="/"
                                    onClick={handleSignOut}
                                    className={classNames(
                                      active
                                        ? "bg-gray-100 dark:bg-gray-900 text-red-500"
                                        : "text-red-500 hover:text-red-700",
                                      "block px-4 py-2 text-sm"
                                    )}
                                  >
                                    <BiSolidExit className="icon inline mr-2 text-red-500" fontSize="1.2rem" /> Sign Out
                                  </a>
                                )}
                              </Menu.Item>
                            </div>
                          </Menu.Items>
                        </Transition>
                      </Menu>
                    ) : (
                      <div className="space-x-4 py-1">
                        <a
                          href="/login"
                          className="bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 rounded-md text-sm font-medium"
                        >
                           <VscAccount className="plus-icon inline -mt-0.5" /> Login
                        </a>
                        <a
                          href="/register"
                          className="bg-green-700 hover:bg-green-800 text-white px-3 py-2 rounded-md text-sm font-medium"
                        >
                          <AiOutlineUserAdd className="plus-icon inline -mt-0.5" /> Create an account
                        </a>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </div>
            <div className="-mr-2 flex flex-col md:hidden">
              <button
                onClick={() => setIsOpen(!isOpen)}
                type="button"
                className="bg-gray-300 inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white"
                aria-controls="mobile-menu"
                aria-expanded="false"
              >
                <span className="sr-only">Open main menu</span>
                {!isOpen ? (
                  <svg
                    className="block h-6 w-6"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    aria-hidden="true"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth="2"
                      d="M4 6h16M4 12h16M4 18h16"
                    />
                  </svg>
                ) : (
                  <svg
                    className="block h-6 w-6"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    aria-hidden="true"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth="2"
                      d="M6 18L18 6M6 6l12 12"
                    />
                  </svg>
                )}
              </button>
            </div>
          </div>
        </div>

        <Transition
          show={isOpen}
          enter="transition ease-out duration-100 transform"
          enterFrom="opacity-0 scale-95"
          enterTo="opacity-100 scale-100"
          leave="transition ease-in duration-75 transform"
          leaveFrom="opacity-100 scale-100"
          leaveTo="opacity-0 scale-95"
        >
          <div className="md:hidden" id="mobile-menu">
            <div className="flex flex-col items-center space-y-3 px-2 pt-2 pb-3 sm:px-3">
              {links.map((link, index) => (
                <a
                  href={link.toLowerCase().replaceAll(" ", "-")}
                  key={index}
                  className="hover:bg-gray-300 px-3 py-2 rounded-md text-sm font-medium dark:hover:bg-gray-800"
                >
                  {link}
                </a>
              ))}
              {user && (
                    <a href="/new" className="new-ad-button">
                      <AiOutlinePlus className="plus-icon" />
                      New product&nbsp;
                    </a>

                  )}
              {currentUser !== null ? (
                <Menu
                  as="div"
                  className="relative inline-block text-left"
                >
                  <div>
                    <Menu.Button className="inline-flex justify-center gap-x-1.5 rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 dark:bg-blue-700 opacity-80 dark:hover:bg-blue-800 dark:ring-gray-900 dark:text-white shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
                      {
                        "Welcome"
                      }
                      , {currentUser.email} <BiSolidDownArrow className="plus-icon inline mt-1.5" style={{ fontSize: 10 }} />
                    </Menu.Button>
                  </div>

                  <Transition
                    as={Fragment}
                    enter="transition ease-out duration-100"
                    enterFrom="transform opacity-0 scale-95"
                    enterTo="transform opacity-100 scale-100"
                    leave="transition ease-in duration-75"
                    leaveFrom="transform opacity-100 scale-100"
                    leaveTo="transform opacity-0 scale-95"
                  >
                    <Menu.Items className="absolute flex flex-col right-0 z-10 mt-2 w-56 origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 dark:bg-gray-800 dark:divide-gray-700 ring-black ring-opacity-5 focus:outline-none">
                      <div className="py-1">
                        {profileLinks.map((link, index) => (
                          <Menu.Item key={index}>
                            {({ active }) => (
                              <a
                                href={link
                                  .toLowerCase()
                                  .replaceAll(" ", "-")}
                                className={classNames(
                                  active
                                    ? "bg-gray-100 dark:bg-gray-900 text-gray-900"
                                    : "text-gray-700",
                                  "block px-4 py-2 text-sm dark:text-gray-300 dark:hover:bg-gray-900"
                                )}
                              >
                                <RiSettingsLine className="icon inline mr-2 dark:text-white" fontSize="1.2rem" />{link}
                              </a>
                            )}
                          </Menu.Item>
                        ))}
                      </div>
                      {user && (
                        <div className="py-1">
                          <Menu.Item>
                            {({ active }) => (
                              <a
                                href="/products-orders"
                                className={classNames(
                                  active
                                    ? "bg-gray-100 dark:bg-gray-900 text-gray-900"
                                    : "text-gray-700",
                                  "block px-4 py-2 text-sm dark:text-gray-300 dark:hover:bg-gray-900"
                                )}
                              >
                                <LuBarChartBig className="icon inline mr-2 dark:text-white" fontSize="1.2rem" /> Products & Orders
                              </a>
                            )}
                          </Menu.Item>
                        </div>
                      )}
                      <div className="py-1">
                        <Menu.Item>
                          {({ active }) => (
                            <a
                              href="/"
                              onClick={handleSignOut}
                              className={classNames(
                                active
                                  ? "bg-gray-100 dark:bg-gray-900 text-red-500"
                                  : "text-red-500 hover:text-red-700",
                                "block px-4 py-2 text-sm"
                              )}
                            >
                              <BiSolidExit className="icon inline mr-2 text-red-500" fontSize="1.2rem" /> Sign Out
                            </a>
                          )}
                        </Menu.Item>
                      </div>                    
                    </Menu.Items>
                  </Transition>
                </Menu>
              ) : (
                <div className="flex flex-col justify-center items-center space-y-3 pb-3">
                  <a
                    href="/login"
                    className="bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 rounded-md text-sm font-medium"
                  >
                    <VscAccount className="plus-icon inline -mt-0.5" /> Login
                  </a>
                  <a
                    href="/register"
                    className="bg-green-700 hover:bg-green-800 text-white px-3 py-2 rounded-md text-sm font-medium"
                  >
                    <AiOutlineUserAdd className="plus-icon inline -mt-0.5" /> Create an account
                  </a>
                </div>
              )}
            </div>
          </div>
        </Transition>
      </nav>
      <hr className="h-px bg-gray-300 border-0" />
    </div>
  );
}

export default Navbar;
