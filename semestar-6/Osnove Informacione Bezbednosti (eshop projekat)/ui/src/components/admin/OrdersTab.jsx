import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import axios from 'axios';
import LoadingSpinner from '../loading/loading';
import { FiArrowUp, FiArrowDown } from 'react-icons/fi';

const OrdersTab = () => {
    const navigate = useNavigate();
    const { currentUser } = useAuth();
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [sortBy, setSortBy] = useState('name');
    const [ascDesc, setAscDesc] = useState(true);
    const [searchQuery, setSearchQuery] = useState('');

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
                    global.APIEndpoint + '/api/order/get',
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
                setLoading(false);

                if (response.status !== 200) 
                    navigate('/' + response.status.toString());
            } catch (error) {
                console.log(error)
                navigate('/403');
            }
        };

        fetchData();
    }, [currentUser, navigate]);
  
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
            sortedData = sortedData.filter((order) =>
                order.product.author.toLowerCase().includes(lowerCaseQuery) ||
                order.product.name.toLowerCase().includes(lowerCaseQuery)
            );
        }

        if (sortBy === 'name') {
            sortedData = sortedData.sort((a, b) => {
                const nameA = a.product.name.toLowerCase();
                const nameB = b.product.name.toLowerCase();
        
                return ascDesc ? nameA.localeCompare(nameB) : nameB.localeCompare(nameA);
            });
        } else if (sortBy === 'seller') {
          sortedData = sortedData.sort((a, b) => {
            console.log(sortedData);
              const sellerA = a.product.sellerUid.toLowerCase();
              const sellerB = b.product.sellerUid.toLowerCase();
      
              return ascDesc ? sellerA.localeCompare(sellerB) : sellerB.localeCompare(sellerA);
          });
        } else if (sortBy === 'buyer') {
          sortedData = sortedData.sort((a, b) => {
              const buyerA = a.buyerUid.toLowerCase();
              const buyerB = b.buyerUid.toLowerCase();
      
              return ascDesc ? buyerA.localeCompare(buyerB) : buyerB.localeCompare(buyerA);
          });
        } else if (sortBy === 'price') {
            sortedData = sortedData.sort((a, b) => {
                const priceA = parseFloat(a.product.price);
                const priceB = parseFloat(b.product.price);

                return ascDesc ? priceA - priceB : priceB - priceA;
            });
        } else if (sortBy === 'quantity') {
            sortedData = sortedData.sort((a, b) => {                
                const quantityA = parseInt(a.buyQuantity);
                const quantityB = parseInt(b.buyQuantity);

                return ascDesc ?  quantityA - quantityB : quantityB - quantityA ;
            });
        } else if (sortBy === 'totalPrice') {
            sortedData = sortedData.sort((a, b) => {
                const totalPriceA = parseInt(a.total);
                const totalPriceB = parseInt(b.total);

                return ascDesc ? totalPriceA - totalPriceB : totalPriceB - totalPriceA;
            });
        } else {
            sortedData = sortedData.sort((a, b) => {
                if (sortBy === 'orderDate') {
                    const fdateA = new Intl.DateTimeFormat('en-GB', {
                        year: 'numeric',
                        month: '2-digit',
                        day: '2-digit',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                    }).format(new Date(a.orderDate._seconds * 1000)).replace(/\//g, '.');
                    const fdateB = new Intl.DateTimeFormat('en-GB', {
                        year: 'numeric',
                        month: '2-digit',
                        day: '2-digit',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                    }).format(new Date(b.orderDate._seconds * 1000)).replace(/\//g, '.');

                    const dateA = new Date(fdateA);
                    const dateB = new Date(fdateB);

                    return ascDesc ? dateA - dateB : dateB - dateA;
                } else {
                    return ascDesc
                        ? a[sortBy].localeCompare(b[sortBy]) // Ascending
                        : b[sortBy].localeCompare(a[sortBy]); // Descending
                }
            });
        }
    }

    return loading === true ? (
        <LoadingSpinner />
    ) : data !== null ? (

        <div className="p-4 bg-white dark:bg-slate-800 bg-opacity-60 rounded-lg shadow-lg mx-6 my-4">
            <p className="text-gray-700 dark:text-gray-200 mb-6 ml-1 my-2 text-center font-medium" style={{ fontSize: 17.5 }}>
                Explore the product data, utilize sorting and search capabilities to quickly find the information
                you need. You can also take various actions on products, such as editing details,
                deleting products, and performing sort operations. <br />
            </p>
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
                            {/* <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('orderDate')}
                            >
                                Order Date{' '}
                                {sortBy === 'orderDate' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th> */}
                            <th
                                scope="col"
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('seller')}
                            >
                                Seller{' '}
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
                                className="px-6 py-3 cursor-pointer"
                                onClick={() => handleSortBy('buyer')}
                            >
                                Buyer{' '}
                                {sortBy === 'buyer' ? (
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
                                onClick={() => handleSortBy('totalPrice')}
                            >
                                Total Price{' '}
                                {sortBy === 'totalPrice' ? (
                                    ascDesc ? (
                                        <FiArrowUp className="inline" />
                                    ) : (
                                        <FiArrowDown className="inline" />
                                    )
                                ) : <div></div>}
                            </th>                                                                         
                        </tr>
                    </thead>
                    <tbody>
                        {sortedData.map((order) => (
                            <tr
                                key={order.uid}
                                className="bg-white border-1 border-b-gray-950 dark:bg-gray-900 dark:border-gray-700"                            
                            >
                                <td className="px-6 py-4 font-medium">
                                    <div className="flex-shrink-0 flex items-center">
                                        <img
                                            className="h-16 w-16"
                                            src={order.product.photoBase64}
                                            alt="pi"
                                        />
                                    </div>
                                </td>
                                <td className="px-6 py-4">{order.product.name}</td>
                                <td className="px-6 py-4">{order.product.price}</td>
                                <td className="px-6 py-4">{order.buyQuantity}</td>
                                {/* <td className="px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white">
                                    {new Intl.DateTimeFormat('en-GB', {
                                        year: 'numeric',
                                        month: '2-digit',
                                        day: '2-digit',
                                        hour: '2-digit',
                                        minute: '2-digit',
                                        second: '2-digit'
                                    }).format(new Date(order.orderDate._seconds * 1000)).replace(/\//g, '.')}
                                </td> */}
                                <td className="px-6 py-4">{order.product.sellerUid}</td>
                                <td className="px-6 py-4">{order.buyerUid}</td>
                                <td className="px-6 py-4">{order.total}</td>                                
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

export default OrdersTab;