import React, { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import axios from 'axios';
import LoadingSpinner from '../loading/loading';
import { FiArrowUp, FiArrowDown } from 'react-icons/fi';
import { AiOutlineClose, AiFillCheckCircle } from 'react-icons/ai';
import { CiEdit, CiCircleMinus } from 'react-icons/ci';
import { CiImageOff } from 'react-icons/ci';
import { BsFillFileEarmarkImageFill } from 'react-icons/bs';
import imageCompression from 'browser-image-compression';

const ProductsTab = () => {
    const navigate = useNavigate();
    const { currentUser } = useAuth();
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [sortBy, setSortBy] = useState('name');
    const [ascDesc, setAscDesc] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');
    const [error, setError] = useState("");
    const [selectedGenres, setSelectedGenres] = useState([]);

    // info modal
    const [showModal, setShowModal] = useState(false);
    const [modalText, setModalText] = useState("");
    const [modalDesc, setModalDesc] = useState("");

    // edit modal
    const [showEditProductModal, setShowEditAccountModal] = useState(false);
    const [editData, setEditData] = useState({});

    const [isModalVisible, setIsModalVisible] = useState(false);
    const [uidToDelete, setUid] = useState("");
    const [sellerUidToDelete, setSellerUidToDelete] = useState("");
    const [refresh, setRefresh] = useState(false); // refresh users table after CRUD operations

    // profile picture
    const imageRef = useRef(null);
    const [oldImage, setOldImage] = useState(null);

    // available genres
    const [genres, setGenres] = useState(null);

    const handleGenreSelection = (selected) => {
        setSelectedGenres(selected);
      };

    useEffect(() => {
        setLoading(true);

        const fetchData = async () => {
            if (!currentUser) {
                navigate('/login');
                return;
            }

            try {
                const token = await currentUser.getIdToken();                
                const response = await axios.get(global.APIEndpoint + '/api/product/get', {
                  headers: {
                    Authorization: `${token}`,
                    'Content-Type': 'application/json',
                  },
                });

                setData(response.data.payload);

                // fetch genres from firestore
                try {
                    const token = await currentUser.getIdToken();
                    const response = await axios.get(
                        global.APIEndpoint + '/api/genre/get',
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

                    setGenres(response.data.payload);

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

    // Function to check if product selected new picture from own library
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
        if (key === sortBy) {
            setAscDesc(!ascDesc);
        } else {
            setSortBy(key);
            setAscDesc(true);
        }

    };

    let sortedData = data;

    if (sortedData) {
        if (searchQuery.trim() !== '') {
            const lowerCaseQuery = searchQuery.toLowerCase();
            sortedData = sortedData.filter((product) =>
                product.author.toLowerCase().includes(lowerCaseQuery) ||
                product.name.toLowerCase().includes(lowerCaseQuery)
            );
        }

        if (sortBy === 'used') {
            sortedData = sortedData.sort((a, b) => {
                // Convert 'true' to 1 and 'false' to 0
                const valueA = a.used ? 1 : 0;
                const valueB = b.used ? 1 : 0;

                if (ascDesc) {
                    return valueA - valueB;
                } else {
                    return valueB - valueA;
                }
            });
        } else if (sortBy === 'seller') {
            sortedData = sortedData.sort((a, b) => {
                console.log(sortedData);
                const sellerA = a.product.sellerUid.toLowerCase();
                const sellerB = b.product.sellerUid.toLowerCase();
        
                return ascDesc ? sellerA.localeCompare(sellerB) : sellerB.localeCompare(sellerA);
            });
        } else if (sortBy === 'price') {
            sortedData = sortedData.sort((a, b) => {
                const priceA = parseFloat(a.price);
                const priceB = parseFloat(b.price);

                return ascDesc ? priceA - priceB : priceB - priceA;
            });
        } else if (sortBy === 'quantity') {
            sortedData = sortedData.sort((a, b) => {
                const quantityA = parseInt(a.quantity);
                const quantityB = parseInt(b.quantity);

                return ascDesc ? quantityA - quantityB : quantityB - quantityA;
            });
        } else {
            sortedData = sortedData.sort((a, b) => {
                if (sortBy === 'date') {
                    const dateA = new Date(a.dateValidity);
                    const dateB = new Date(b.dateValidity);
                    return ascDesc ? dateA - dateB : dateB - dateA;
                } else {
                    return ascDesc
                        ? a[sortBy].localeCompare(b[sortBy]) // Ascending
                        : b[sortBy].localeCompare(a[sortBy]); // Descending
                }
            });
        }
    }

    // Function to toggle the "Edit Account" modal
    const toggleEditProductModal = () => {
        setShowEditAccountModal(!showEditProductModal);
        setError("");
    };

    // Function to handle input changes for creating a new account
    const handleEditProductInputChange = (e) => {
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

    // Function to handle the "Delete product" button click
    const handleDeleteProductClick = async () => {
        if (uidToDelete === "" || sellerUidToDelete === "") return;

        // Handle the product deletion logic here
        try {
            const token = await currentUser.getIdToken();
            const response = await axios.post(
                global.APIEndpoint + "/api/product/delete",
                {
                    uid: uidToDelete,
                    sellerUid: sellerUidToDelete,
                    currentUserUid: currentUser.uid
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
            setModalText("Product has been deleted");
            setModalDesc("Product and all data has been removed.");
            setShowModal(true);
            setRefresh(!refresh);
        } catch (error) {
            console.log(error)
            // Close the modal after successful deletion
            setIsModalVisible(false);

            setModalText("Product has not been deleted");
            setModalDesc("Product can't be deleted right now. Try again later.");
            setShowModal(true);
        }
    };

    const handleDeleteProduct = (uid, sellerUid) => {
        setUid(uid);
        setSellerUidToDelete(sellerUid)
        setIsModalVisible(true);
    };

    const handleEditProduct = (product) => {
        setEditData({ ...product });
        setOldImage(product.photoBase64); // save old image before edit
        setShowEditAccountModal(true);
        setError("");
    };

    // Function to handle edit data of account
    const saveDataEdit = async () => {
        editData.used = editData.used === "true" ? true : false; // string to bool
        
        console.log("Selected Genres:", selectedGenres);
        
        // send new product info and call API
        try {
            const token = await currentUser.getIdToken();

            // call api to register a update product
            const response = await axios.post(
                global.APIEndpoint + "/api/product/update/",
                {
                    currentUserUid: currentUser.uid,
                    payload: editData,
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
                Explore the product data, utilize sorting and search capabilities to quickly find the information
                you need. You can also take various actions on products, such as editing details,
                deleting products, and performing sort operations. <br />
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
                            Delete product
                        </h2>
                        <p className="text-gray-600 dark:text-gray-400">
                            Are you sure you want to delete product? This action cannot
                            be undone.
                        </p>
                        <div className="flex justify-end mt-5">
                            <button
                                onClick={handleDeleteProductClick}
                                className="bg-red-500 dark:bg-rose-700 text-white font-semibold px-4 py-2 rounded mr-4 hover:bg-rose-800"
                            >
                                Yes, delete product
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
                    placeholder="Search products..."
                    className="w-full p-2 mb-4 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-xl"
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    style={{ outline: 'none' }}
                />
                {/* Edit Product Modal */}
                {showEditProductModal && (
                    <div className="fixed z-10 inset-0 overflow-y-auto backdrop-blur-2xl backdrop-filter dark:backdrop-blur-md dark:backdrop-filter" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                        <div className="flex mt-12 md:mt-0 items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                            <div className="fixed inset-0bg-opacity-75 transition-opacity" aria-hidden="true" />
                            <span className="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">
                                &#8203;
                            </span>
                            <div className="inline-block align-bottom dark:bg-gray-800 dark:text-white rounded-lg text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                                <div className="bg-slate-50 dark:bg-gray-800 px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                    <h3 className="text-lg font-medium text-gray-900 dark:text-white" id="modal-title">
                                        Edit product details
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
                                                        Product picture
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
                                                        Author
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="author"
                                                        value={editData.author || ''}
                                                        onChange={handleEditProductInputChange}
                                                        required
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Product Name
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="name"
                                                        required
                                                        value={editData.name || ''}
                                                        onChange={handleEditProductInputChange}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div className="mb-4">
                                            <div className="">
                                                {/*<div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Genres
                                                    </label>                                                    
                                                    {console.log(editData)}
                                                    <Combo genresArr={genres} setter={handleGenreSelection} initialSelectedGenres={editData.genres}/>
                                                </div> */}
                                                <div className="w-full">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Valid Until
                                                    </label>
                                                    <input
                                                        type="date"
                                                        name="dateValidity"
                                                        required
                                                        value={editData.dateValidity || ''}
                                                        onChange={handleEditProductInputChange}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div className="mb-4">
                                            <div className="flex space-x-4">
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Price
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="price"
                                                        value={editData.price || ''}
                                                        onChange={handleEditProductInputChange}
                                                        required
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Quantity
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="quantity"
                                                        required
                                                        value={editData.quantity || ''}
                                                        onChange={handleEditProductInputChange}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                            </div>
                                        </div>


                                        <div className="mb-4">
                                            <div className="flex space-x-4">
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Production Year
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="productionYear"
                                                        value={editData.productionYear || ''}
                                                        onChange={handleEditProductInputChange}
                                                        required
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    />
                                                </div>
                                                <div className="w-1/2">
                                                    <label className="block text-gray-700 dark:text-gray-300 text-sm font-medium mb-2">
                                                        Is New
                                                    </label>
                                                    <select
                                                        id="used"
                                                        name="used"
                                                        required
                                                        onChange={handleEditProductInputChange}
                                                        value={editData.used.toString()}
                                                        className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"
                                                    >
                                                        <option value="false">New</option>
                                                        <option value="true">Used</option>
                                                    </select>
                                                </div>
                                            </div>
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
                                                onClick={toggleEditProductModal}
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
                <table className="w-full text-md text-left text-black dark:text-white">
                    <thead className="text-md text-white uppercase bg-primary-900 opacity-80">
                        <tr>
                            <th
                                scope="col"
                                className="px-6 py-3"
                            >
                                Product Picture{' '}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('name')}
                            >
                                Name{' '}
                                {sortBy === 'name' ? (
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
                                onClick={() => handleSortBy('price')}
                            >
                                Price{' '}
                                {sortBy === 'price' ? (
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
                                onClick={() => handleSortBy('quantity')}
                            >
                                Quantity{' '}
                                {sortBy === 'quantity' ? (
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
                                onClick={() => handleSortBy('productionYear')}
                            >
                                Production Year{' '}
                                {sortBy === 'productionYear' ? (
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
                            >
                                Genres{' '}
                            </th>
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('seller')}
                            >
                                Seller UID{' '}
                                {sortBy === 'seller' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>                            
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer text-center"
                                onClick={() => handleSortBy('used')}
                            >
                                Is New{' '}
                                {sortBy === 'used' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>
                            <th scope="col" className="px-6 py-3">
                                Manage Product
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {sortedData.map((product) => (
                            <tr
                                className="bg-white border-1 border-b-gray-950 dark:bg-gray-900 dark:border-gray-700"
                                key={product.uid}
                            >
                                <td className="px-6 py-4 font-medium">
                                    <div className="flex-shrink-0 flex items-center">
                                        <img
                                            className="h-16 w-16"
                                            src={product.photoBase64}
                                            alt="pi"
                                        />
                                    </div>
                                </td>
                                <td className="px-6 py-4">{product.name}</td>
                                <td className="px-6 py-4">{product.price}</td>
                                <td className="px-6 py-4">{product.quantity}</td>
                                <td className="px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white">
                                    {/* Date */}
                                    {new Date(product.productionYear).toLocaleDateString('en-GB').replace(/\//g, '.')}
                                </td>
                                <td className="px-6 py-4 font-medium">
                                    {product.genres.map((genre, index) => (
                                        index === product.genres.length - 1 ?
                                            <span key={index}>{genre.name} </span>
                                            :
                                            <span key={index}>{genre.name}, </span>
                                    ))}

                                </td>
                                <td className='px-6 py-4'>{product.sellerUid}</td>
                                <td className="px-6 py-4">
                                    {!product.used ? <div className='flex flex-col items-center'><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="green" className="w-6 h-6 inline -mt-0.5">
                                        <path strokeLinecap="round" strokeLinejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                    </svg><span>&nbsp;&nbsp;New</span></div>

                                        : <div className='flex flex-col items-center'><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="crimson" className="w-6 h-6 inline -mt-0.5">
                                            <path strokeLinecap="round" strokeLinejoin="round" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
                                        </svg><span>&nbsp;&nbsp;Used</span></div>
                                    }
                                </td>
                                <td className="px-6 py-4">
                                    <div className="flex flex-wrap gap-2 items-center justify-center">
                                        {/* Buttons for Edit, Delete Product*/}
                                        <button onClick={() => handleEditProduct(product)} className="px-4 py-1.5 bg-blue-800 text-white rounded-lg hover:bg-blue-900"><CiEdit className="plus-icon -mt-1 inline" /> Edit</button>
                                        <button onClick={() => handleDeleteProduct(product.uid, product.sellerUid)} className="px-4 py-1.5 bg-red-800 text-white rounded-lg hover:bg-red-900"><CiCircleMinus className="plus-icon -mt-1 inline" /> Delete</button>
                                    </div>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    ) : (
        <div></div>
    );
};

export default ProductsTab;