import React, { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import axios from 'axios';
import LoadingSpinner from '../loading/loading';
import { FiArrowUp, FiArrowDown } from 'react-icons/fi';
import { AiOutlineUserAdd, AiOutlineClose, AiFillCheckCircle } from 'react-icons/ai';
import { FaUserEdit, FaUserMinus, FaKey } from 'react-icons/fa';
import { CiImageOff } from 'react-icons/ci';
import { BsFillFileEarmarkImageFill } from 'react-icons/bs';
import imageCompression from 'browser-image-compression';

const UsersTab = () => {
    const navigate = useNavigate();
    const { currentUser, resetPasswordEmailUser } = useAuth();
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [sortBy, setSortBy] = useState('firstName');
    const [ascDesc, setAscDesc] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');
    const [showCreateAccountModal, setShowCreateAccountModal] = useState(false); // State for showing the create account modal
    const [newAccountData, setNewAccountData] = useState({});
    const [error, setError] = useState("");

    // info modal
    const [showModal, setShowModal] = useState(false);
    const [modalText, setModalText] = useState("");
    const [modalDesc, setModalDesc] = useState("");

    // edit modal
    const [showEditAccountModal, setShowEditAccountModal] = useState(false);
    const [editData, setEditData] = useState({});

    const [isModalVisible, setIsModalVisible] = useState(false);
    const [uidToDelete, setUid] = useState(null);
    const [refresh, setRefresh] = useState(false); // refresh users table after CRUD operations

    // profile picture
    const imageRef = useRef(null);
    const [oldImage, setOldImage] = useState(null);

    // available roles
    const [roles, setRoles] = useState(null);

    useEffect(() => {
        setLoading(true);

        const fetchData = async () => {
            if (!currentUser) {
                navigate('/login');
                return;
            }

            try {
                const token = await currentUser.getIdToken();
                const response = await axios.post(
                    global.APIEndpoint + '/api/user/get', // Adjust the API endpoint for fetching user data
                    {
                        uid: currentUser.uid,
                    },
                    {
                        headers: {
                            Authorization: `${token}`,
                            'Content-Type': 'application/json',
                        },
                    }
                );

                setData(response.data.payload);

                // fetch roles from firestore
                try {
                    const token = await currentUser.getIdToken();
                    const response = await axios.post(
                        global.APIEndpoint + '/api/role/get', // Adjust the API endpoint for fetching user data
                        {
                            uid: currentUser.uid,
                        },
                        {
                            headers: {
                                Authorization: `${token}`,
                                'Content-Type': 'application/json',
                            },
                        }
                    );

                    setRoles(response.data.payload);

                    if (response.status !== 200) navigate('/' + response.status.toString());
                } catch (error) {
                    navigate('/403');
                }

                setLoading(false);

                if (response.status !== 200) navigate('/' + response.status.toString());
            } catch (error) {
                navigate('/403');
            }
        };

        fetchData();
    }, [currentUser, navigate, refresh]);

    // Function to check if user selected new picture from own library
    const handleImageChange = async (e) => {
        const file = e.target.files[0];
        if (file) {
            try {
                const options = {
                    maxSizeMB: 1, // Maximum size after compression (1MB in this example)
                    maxWidthOrHeight: 800, // Maximum width or height after compression
                };

                const compressedFile = await imageCompression(file, options);

                const reader = new FileReader();

                reader.onload = (event) => {
                    const base64String = event.target.result; // This is the base64 string of the compressed image.
                    editData.photoBase64 = base64String;

                    if (imageRef.current) {
                        imageRef.current.src = base64String;
                    }
                };

                reader.readAsDataURL(compressedFile);
            } catch (error) {
                console.error('Error compressing image:', error);
            }
        } else {
            // no image has been selected
            if (imageRef.current) {
                imageRef.current.src = oldImage;
                editData.photoBase64 = oldImage;
            }
        }
    };

    // sorting
    const handleSortBy = (key) => {
        if (key === 'enabled') {
            if (key === sortBy) {
                setAscDesc(!ascDesc);
            } else {
                setSortBy(key);
                setAscDesc(true);
            }
        } else {
            if (key === sortBy) {
                setAscDesc(!ascDesc);
            } else {
                setSortBy(key);
                setAscDesc(true);
            }
        }
    };

    let sortedData = data;

    if (sortedData) {
        if (searchQuery.trim() !== '') {
            const lowerCaseQuery = searchQuery.toLowerCase();
            sortedData = sortedData.filter((user) =>
                user.firstName.toLowerCase().includes(lowerCaseQuery) ||
                user.lastName.toLowerCase().includes(lowerCaseQuery) ||
                user.email.toLowerCase().includes(lowerCaseQuery)
            );
        }

        if (sortBy === 'enabled') {
            sortedData = sortedData.sort((a, b) => {
                // Convert 'true' to 1 and 'false' to 0
                const valueA = a.disabled ? 1 : 0;
                const valueB = b.disabled ? 1 : 0;

                if (ascDesc) {
                    return valueA - valueB;
                } else {
                    return valueB - valueA;
                }
            });
        } else {
            sortedData = sortedData.sort((a, b) => {
                if (sortBy === 'date') {
                    const dateA = new Date(a.date);
                    const dateB = new Date(b.date);
                    return ascDesc ? dateA - dateB : dateB - dateA;
                } else {
                    return ascDesc
                        ? a[sortBy].localeCompare(b[sortBy]) // Ascending
                        : b[sortBy].localeCompare(a[sortBy]); // Descending
                }
            });
        }
    }

    // Function to toggle the "Create Account" modal
    const toggleCreateAccountModal = () => {
        setShowCreateAccountModal(!showCreateAccountModal);

        if (showCreateAccountModal === false) {
            setNewAccountData([]);
        }

        setError("");
    };

    // Function to toggle the "Edit Account" modal
    const toggleEditAccountModal = () => {
        setShowEditAccountModal(!showEditAccountModal);
        setError("");
    };

    // Function to handle input changes for creating a new account
    const handleNewAccountInputChange = (e) => {
        const { name, value } = e.target;
        setNewAccountData({
            ...newAccountData,
            [name]: value,
        });
    };

    // Function to handle input changes for creating a new account
    const handleEditAccountInputChange = (e) => {
        const { name, value } = e.target;
        setEditData({
            ...editData,
            [name]: value,
        });
    };

    // Modal handle functions
    const handleGotItClick = () => {
        setShowModal(false);
    };

    // Function to handle the "Delete Account" button click
    const handleDeleteAccountClick = async () => {
        if (uidToDelete == null) return;

        // Handle the account deletion logic here
        try {
            const token = await currentUser.getIdToken();
            const response = await axios.post(
                global.APIEndpoint + "/api/user/delete/guid",
                {
                    uid: uidToDelete,
                },
                {
                    headers: {
                        Authorization: `${token}`,
                        "Content-Type": "application/json",
                    },
                }
            );

            if (response.status !== 200)
                navigate('/' + response.status.toString());

            // Close the modal after successful deletion
            setIsModalVisible(false);

            // show info modal that account is deleted
            setModalText("Account has been deleted");
            setModalDesc("Account and all data has been removed. User will be logged out soon.");
            setShowModal(true);
            setRefresh(!refresh);
        } catch (error) {
            setModalText("Account has not been deleted");
            setModalDesc("Account can't be deleted right now. Try again later.");
            setShowModal(true);
        }
    };

    const handleDeleteAccount = (uid) => {
        setUid(uid);
        setIsModalVisible(true);
    };

    const handleEditAccount = (user) => {
        setEditData({ ...user });
        setOldImage(user.photoBase64); // save old image before edit
        setShowEditAccountModal(true);
        setError("");
    };

    // reset password action
    const handlePasswordReset = (email) => {
        resetPasswordEmailUser(email);
        setModalText("Email has been sent");
        setModalDesc("Notify user to check email for further instructions.");
        setShowModal(true);
    };

    // Function to handle the creation of a new account (you can implement this logic)
    const handleCreateAccount = async () => {
        const userProperties = {
            email: newAccountData.email,
            emailVerified: true, // account created by an admin is trusted by admin
            password: newAccountData.password,
            displayName: newAccountData.firstName + ' ' + newAccountData.lastName,
            disabled: false
        };

        const userData = {
            uid: "",
            email: newAccountData.email,
            firstName: newAccountData.firstName,
            lastName: newAccountData.lastName,
            date: newAccountData.birthday,
        };

        try {
            const token = await currentUser.getIdToken();

            // call api to register a new user
            const response = await axios.post(
                global.APIEndpoint + "/api/user/newAccount",
                {
                    uid: currentUser.uid,
                    userProperties: userProperties,
                    userData: userData
                },
                {
                    headers:
                    {
                        Authorization: `${token}`,
                        "Content-Type": "application/json",
                    },
                }
            );

            // check api's reponse
            if (response.data.code !== 200)
                setError(response.data.payload);
            else {
                setError("AC");
                setTimeout(() => {
                    setShowCreateAccountModal(false);
                    setRefresh(!refresh);
                }, 3000); // Delay in milliseconds (e.g., 2000ms = 2 seconds)
            }
        }
        catch (error) {
            setError(error.response.data.payload)
        }
    };


    // Function to handle edit data of account
    const saveDataEdit = async () => {
        editData.disabled = editData.disabled === "true" ? true : false; // string to bool

        // send new user info and call API
        try {
            const token = await currentUser.getIdToken();

            // call api to register a new user
            const response = await axios.post(
                global.APIEndpoint + "/api/user/update/admin",
                {
                    uid: currentUser.uid,
                    data: editData
                },
                {
                    headers:
                    {
                        Authorization: `${token}`,
                        "Content-Type": "application/json",
                    },
                }
            );

            // check api's reponse
            if (response.status !== 200)
                setError(response.data.payload);
            else {
                setError("AC");
                setTimeout(() => {
                    setShowEditAccountModal(false);
                    setError("");
                    setRefresh(!refresh);
                }, 3000); // Delay in milliseconds (e.g., 2000ms = 2 seconds)
            }
        }
        catch (error) {
            setError(error.response.data.payload)
        }
    };

    return loading === true ? (
        <LoadingSpinner />
    ) : data !== null ? (

        <div className="p-4 bg-white dark:bg-slate-800 bg-opacity-60 rounded-lg shadow-lg mx-6 my-4">
            <p className="text-gray-700 dark:text-gray-200 mb-6 ml-1 my-2 text-center font-medium" style={{ fontSize: 17.5 }}>
                As an admin, you have access to powerful tools and features to manage user profiles.
                Explore the user data, utilize sorting and search capabilities to quickly find the information
                you need. You can also take various actions on user profiles, such as editing details,
                deleting accounts, resetting passwords, and changing user roles. <br />
            </p>
            {showModal && (
                <div className="fixed inset-0 flex items-center justify-center z-50 backdrop-blur-2xl backdrop-filter dark:backdrop-blur-md dark:backdrop-filter">
                    <div className="bg-white w-96 rounded-lg p-6 shadow-lg dark:bg-gray-900 transition-opacity duration-300">
                        <h2 className="text-xl font-semibold mb-4 dark:text-white">
                            {modalText}
                        </h2>
                        <p className="text-gray-600 dark:text-gray-400">{modalDesc}</p>
                        <button
                            onClick={handleGotItClick}
                            className="bg-blue-500 text-white font-semibold px-4 py-2 rounded mt-4 hover:bg-blue-600"
                        >
                            Got it
                        </button>
                    </div>
                </div>
            )}
            {isModalVisible && (
                <div className="fixed inset-0 flex items-center justify-center z-50 backdrop-blur-2xl backdrop-filter dark:backdrop-blur-md dark:backdrop-filter">
                    <div className="bg-white dark:bg-gray-900 w-96 rounded-lg p-6 shadow-lg transition-opacity duration-300">
                        <h2 className="text-xl font-semibold text-red-600 dark:text-red-700 mb-4">
                            Delete Account
                        </h2>
                        <p className="text-gray-600 dark:text-gray-400">
                            Are you sure you want to delete user account? This action cannot
                            be undone.
                        </p>
                        <div className="flex justify-end mt-5">
                            <button
                                onClick={handleDeleteAccountClick}
                                className="bg-red-500 dark:bg-rose-700 text-white font-semibold px-4 py-2 rounded mr-4 hover:bg-rose-800"
                            >
                                I agree to delete account
                            </button>
                            <button
                                onClick={() => { setIsModalVisible(false); setUid(null); }}
                                className="bg-gray-300 text-gray-700 font-semibold px-4 py-2 rounded hover-bg-gray-400"
                            >
                                Cancel
                            </button>
                        </div>
                    </div>
                </div>
            )}
            <div className="relative overflow-x-auto shadow-md sm:rounded-lg mb-2">
                {/* Search Bar */}
                <input
                    type="text"
                    placeholder="Search users..."
                    className="w-full p-2 mb-4 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-xl"
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    style={{ outline: 'none' }}
                />
                {/* Create Account Modal */}
                {showCreateAccountModal && (
                    <div className="fixed z-10 inset-0 overflow-y-auto backdrop-blur-2xl backdrop-filter dark:backdrop-blur-md dark:backdrop-filter" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                        <div className="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                            <div className="fixed inset-0bg-opacity-75 transition-opacity" aria-hidden="true" />
                            <span className="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">
                                &#8203;
                            </span>
                            <div className="inline-block align-bottom dark:bg-gray-800 dark:text-white rounded-lg text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                                <div className="bg-slate-50 dark:bg-gray-800 px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                    <h3 className="text-lg font-medium text-gray-900 dark:text-white" id="modal-title">
                                        Create a new account
                                    </h3>
                                    <div className="mt-6">
                                        <div className="mb-4 flex space-x-4">
                                            <div className="w-1/2">
                                                <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                    First Name
                                                </label>
                                                <input
                                                    type="text"
                                                    name="firstName"
                                                    value={newAccountData.firstName || ''}
                                                    onChange={handleNewAccountInputChange}
                                                    required
                                                    className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                />
                                            </div>
                                            <div className="w-1/2">
                                                <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                    Last Name
                                                </label>
                                                <input
                                                    type="text"
                                                    name="lastName"
                                                    required
                                                    value={newAccountData.lastName || ''}
                                                    onChange={handleNewAccountInputChange}
                                                    className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                />
                                            </div>
                                        </div>
                                        <div className='mb-4'>
                                            <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                Email
                                            </label>
                                            <input
                                                type="email"
                                                name="email"
                                                required
                                                value={newAccountData.email || ''}
                                                onChange={handleNewAccountInputChange}
                                                className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                            />
                                        </div>
                                        <div className="mb-4">
                                            <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                Birthday
                                            </label>
                                            <input
                                                type="date"
                                                name="birthday"
                                                required
                                                value={newAccountData.birthday || ''}
                                                onChange={handleNewAccountInputChange}
                                                className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                            />
                                        </div>
                                        <div className="mb-4">
                                            <div className="mb-4 mt-4">
                                                <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                    Password
                                                </label>
                                                <input
                                                    type="password"
                                                    name="password"
                                                    minLength={6}
                                                    required
                                                    value={newAccountData.password || ''}
                                                    onChange={handleNewAccountInputChange}
                                                    className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                />
                                            </div>
                                        </div>
                                        <div className='ml-1 text-center'>
                                            {error === "AC" ? <span className='text-green-600'>User account has been created</span> : <span className='text-red-600'>{error}</span>}
                                        </div>
                                        {/* Add similar input fields for other account details, e.g., lastName, email, password */}
                                        <div className="mt-6">
                                            <button
                                                onClick={handleCreateAccount}
                                                className="px-4 py-2 bg-sky-800 text-white font-medium hover:bg-sky-700 rounded-lg"
                                            >
                                                <AiOutlineUserAdd className="plus-icon inline -mt-1" />
                                                Create Account
                                            </button>

                                            <button
                                                onClick={toggleCreateAccountModal}
                                                className="px-4 py-2 bg-red-800 text-white rounded-lg font-medium hover:bg-red-900 ml-4"
                                            >
                                                <AiOutlineClose className="plus-icon inline -mt-0.5" />
                                                Cancel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                )}
                {showEditAccountModal && (
                    <div className="fixed z-10 inset-0 overflow-y-auto backdrop-blur-2xl backdrop-filter dark:backdrop-blur-md dark:backdrop-filter" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                        <div className="flex mt-12 md:mt-0 items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                            <div className="fixed inset-0bg-opacity-75 transition-opacity" aria-hidden="true" />
                            <span className="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">
                                &#8203;
                            </span>
                            <div className="inline-block align-bottom dark:bg-gray-800 dark:text-white rounded-lg text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                                <div className="bg-slate-50 dark:bg-gray-800 px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                    <h3 className="text-lg font-medium text-gray-900 dark:text-white" id="modal-title">
                                        Edit account details
                                    </h3>
                                    <div className="mt-6">
                                        <div className="p-4 mb-4 bg-white border border-gray-200 rounded-lg shadow-sm 2xl:col-span-2 dark:border-gray-700 sm:p-6 dark:bg-slate-700">
                                            <div className="items-center sm:flex xl:block 2xl:flex sm:space-x-4 xl:space-x-0 2xl:space-x-4">
                                                <img
                                                    ref={imageRef}
                                                    className="mb-4 rounded-lg w-28 h-28 sm:mb-0 xl:mb-4 2xl:mb-0"
                                                    src={editData.photoBase64}
                                                    alt=""
                                                />
                                                <div>
                                                    <h3 className="mb-1 text-xl font-bold text-gray-900 dark:text-white">
                                                        Profile picture
                                                    </h3>
                                                    <div className="mb-4 text-sm text-gray-500 dark:text-gray-400">
                                                        JPG or PNG. Max file size of 800Kb
                                                    </div>
                                                    <div className="flex items-center space-x-4">
                                                        <div>
                                                            <input
                                                                type="file"
                                                                accept="image/*"
                                                                onChange={handleImageChange}
                                                                style={{ display: "none" }}
                                                                id="imageInput"
                                                            />
                                                            <label
                                                                htmlFor="imageInput"
                                                                style={{ cursor: "pointer" }}
                                                                className="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-700 dark:hover:bg-primary-800 dark:focus:ring-primary-900"
                                                            >
                                                                <BsFillFileEarmarkImageFill className="plus-icon inline text-white" />
                                                                Select an Image
                                                            </label>
                                                        </div>
                                                        <button
                                                            onClick={() => {
                                                                imageRef.current.src = oldImage;
                                                                editData.photoBase64 = oldImage;
                                                            }}
                                                            type="button"
                                                            className="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-red-800 hover:bg-red-900 focus:ring-4 focus:ring-red-300 dark:bg-red-800 dark:hover:bg-red-900 dark:focus:ring-red-800"
                                                        >
                                                            <CiImageOff className="plus-icon inline" />
                                                            Reset
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="mb-4">
                                            <div className="flex space-x-4">
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        First Name
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="firstName"
                                                        value={editData.firstName || ''}
                                                        onChange={handleEditAccountInputChange}
                                                        required
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Last Name
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="lastName"
                                                        required
                                                        value={editData.lastName || ''}
                                                        onChange={handleEditAccountInputChange}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                            </div>
                                        </div>


                                        <div className="mb-4">
                                            <div className="flex space-x-4">
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Account Role
                                                    </label>
                                                    <select
                                                        id="role"
                                                        name="role"
                                                        required
                                                        onChange={handleEditAccountInputChange}
                                                        value={editData.role || 'user'}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    >
                                                        {roles.map((role) => (
                                                            <option value={role}>{role.charAt(0).toUpperCase() + role.slice(1).toLowerCase()}</option>
                                                        ))}
                                                    </select>
                                                </div>
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Account Status
                                                    </label>
                                                    <select
                                                        id="disabled"
                                                        name="disabled"
                                                        required
                                                        onChange={handleEditAccountInputChange}
                                                        value={editData.disabled.toString()}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    >
                                                        <option value="false">Enabled</option>
                                                        <option value="true">Disabled</option>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                        <div className="mb-4">
                                            <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                Birthday
                                            </label>
                                            <input
                                                type="date"
                                                name="date"
                                                required
                                                value={editData.date || ''}
                                                onChange={handleEditAccountInputChange}
                                                className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                            />
                                        </div>
                                        <div className='ml-1 text-center'>
                                            {error === "AC" ? <span className='text-green-600'>Modifications have been saved</span> : <span className='text-red-600'>{error}</span>}
                                        </div>
                                        {/* Add similar input fields for other account details, e.g., lastName, email, password */}
                                        <div className="mt-6">
                                            <button
                                                onClick={saveDataEdit}
                                                className="px-4 py-2 bg-sky-800 text-white font-medium hover:bg-sky-700 rounded-lg"
                                            >
                                                <AiFillCheckCircle className="plus-icon inline -mt-1" />
                                                Save Data
                                            </button>

                                            <button
                                                onClick={toggleEditAccountModal}
                                                className="px-4 py-2 bg-red-800 text-white rounded-lg font-medium hover:bg-red-900 ml-4"
                                            >
                                                <AiOutlineClose className="plus-icon inline -mt-0.5" />
                                                Cancel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                )}
                <div className="mb-6 mt-2">
                    <button
                        onClick={toggleCreateAccountModal}
                        className="new-account-button"
                        style={{ fontSize: 16, fontWeight: '500' }}
                    >
                        <AiOutlineUserAdd className="plus-icon" />
                        Create new account
                    </button>
                </div>
                <table className="w-full text-md text-left text-black dark:text-white">
                    <thead className="text-md text-white uppercase bg-primary-900 opacity-80">
                        <tr>
                            <th
                                scope="col"
                                className="px-6 py-3"
                            >
                                Profile Picture{' '}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('firstName')}
                            >
                                First Name{' '}
                                {sortBy === 'firstName' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('lastName')}
                            >
                                Last Name{' '}
                                {sortBy === 'lastName' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('email')}
                            >
                                Email{' '}
                                {sortBy === 'email' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('date')}
                            >
                                Birthday{' '}
                                {sortBy === 'date' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('role')}
                            >
                                Role{' '}
                                {sortBy === 'role' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th
                                scope="col"
                                className="px-1 py-3 cursor-pointer"
                                onClick={() => handleSortBy('enabled')}
                            >
                                Account Status{' '}
                                {sortBy === 'enabled' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th scope="col" className="px-6 py-3">
                                Account Administration
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {sortedData.map((user) => (
                            user.uid !== currentUser.uid ? (
                                <tr
                                    className="bg-white border-1 border-b-gray-950 dark:bg-gray-900 dark:border-gray-700"
                                    key={user.uid}
                                >
                                    <td className="px-6 py-4 font-medium">
                                        <div className="flex-shrink-0 flex items-center">
                                            <img
                                                className="h-16 w-16"
                                                src={user.photoBase64}
                                                alt="pi"
                                            />
                                        </div>
                                    </td>
                                    <td className="px-6 py-4">{user.firstName}</td>
                                    <td className="px-6 py-4">{user.lastName}</td>
                                    <td className="px-6 py-4">{user.email}</td>
                                    <td className="px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white">
                                        {/* Date */}
                                        {new Date(user.date).toLocaleDateString('en-GB').replace(/\//g, '.')}
                                    </td>
                                    <td className="px-6 py-4 font-medium">
                                        {user.role.toUpperCase()}
                                    </td>
                                    <td className="px-6 py-4">
                                        {!user.disabled ? <div className='inline'><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="green" className="w-6 h-6 inline -mt-0.5">
                                            <path strokeLinecap="round" strokeLinejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg><span>&nbsp;&nbsp;Enabled</span></div>

                                            : <div className='inline'><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="crimson" className="w-6 h-6 inline -mt-0.5">
                                                <path strokeLinecap="round" strokeLinejoin="round" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
                                            </svg><span>&nbsp;&nbsp;Disabled</span></div>
                                        }
                                    </td>
                                    <td className="px-6 py-4">
                                        <div className="flex flex-wrap gap-2">
                                            {/* Buttons for Edit, Delete, Reset Password, and Change Role */}
                                            <button onClick={() => handleEditAccount(user)} className="px-4 py-1.5 mr-2 bg-blue-800 text-white rounded-lg hover:bg-blue-900"><FaUserEdit className="plus-icon inline" /> Edit</button>
                                            <button onClick={() => handleDeleteAccount(user.uid)} className="px-4 py-1.5 bg-red-800 text-white rounded-lg hover:bg-red-900"><FaUserMinus className="plus-icon inline" /> Delete</button>
                                        </div>
                                        <div className="flex flex-wrap gap-2 mt-4">
                                            <button onClick={() => handlePasswordReset(user.email)} className="px-5 py-1.5 bg-sky-700 text-white rounded-lg hover:bg-sky-800"><FaKey className="plus-icon inline" /> Reset the password</button>
                                        </div>
                                    </td>
                                </tr>) : (<></>)
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    ) : (
        <div></div>
    );
};

export default UsersTab;