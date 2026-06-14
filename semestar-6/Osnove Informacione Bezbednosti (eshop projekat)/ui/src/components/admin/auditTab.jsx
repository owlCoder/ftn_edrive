import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import axios from 'axios';
import LoadingSpinner from '../loading/loading';
import { FiArrowUp, FiArrowDown } from 'react-icons/fi';

const AuditLog = () => {
  const navigate = useNavigate();
  const { currentUser } = useAuth();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [sortBy, setSortBy] = useState('date');
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
          global.APIEndpoint + '/api/audit/get',
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

        if (response.status !== 200) navigate('/' + response.status.toString());
      } catch (error) {
        navigate('/403');
      }
    };

    fetchData();
  }, [currentUser, navigate]);

  const handleSortBy = (key) => {
    setSortBy(key);
    setAscDesc(!ascDesc); // Sort ascending and on the next click, sort descending
  };

  let sortedData = data;

  if (sortedData) {
    if (searchQuery.trim() !== '') {
      const lowerCaseQuery = searchQuery.toLowerCase();
      sortedData = sortedData.filter((audit) =>
        audit.message.toLowerCase().includes(lowerCaseQuery)
      );
    }

    sortedData = sortedData.sort((a, b) => {
      if (sortBy === 'date') {
        return ascDesc
          ? b.date._seconds - a.date._seconds // Ascending
          : a.date._seconds - b.date._seconds; // Descending
      } else {
        return ascDesc
          ? a.messageType.localeCompare(b.messageType) // Ascending
          : b.messageType.localeCompare(a.messageType); // Descending
      }
    });
  }

  return loading === true ? (
    <LoadingSpinner />
  ) : data !== null ? (
    <div className="p-4 bg-white dark:bg-slate-800 bg-opacity-60 rounded-lg shadow-lg mx-6 my-4">
      <p className="text-gray-700 dark:text-gray-200 mb-6 ml-1 my-2 text-center font-medium" style={{ fontSize: 17.5 }}>
        The audit log contains a record of different types of messages, including information messages, warning messages, and error messages, along with their timestamps. <br />
      </p>
      <div className="relative overflow-x-auto shadow-md sm:rounded-lg mb-2">
        {/* Search Bar */}
        <input
          type="text"
          placeholder="Search messages..."
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
                className="px-6 py-3 cursor-pointer"
                onClick={() => handleSortBy('date')}
              >
                Evidence Time{' '}
                {sortBy === 'date' ? (
                  ascDesc ? (
                    <FiArrowUp className="inline" />
                  ) : (
                    <FiArrowDown className="inline" />
                  )
                ) : null}
              </th>
              <th
                scope="col"
                className="px-6 py-3 cursor-pointer"
                onClick={() => handleSortBy('messageType')}
              >
                Type{' '}
                {sortBy === 'messageType' ? (
                  ascDesc ? (
                    <FiArrowUp className="inline" />
                  ) : (
                    <FiArrowDown className="inline" />
                  )
                ) : null}
              </th>
              <th scope="col" className="px-6 py-3">
                Message
              </th>
            </tr>
          </thead>
          <tbody>
            {sortedData.map((audit) => (
              <tr
                className="bg-white border-1 border-b-gray-950 dark:bg-gray-900 dark:border-gray-700"
                key={audit.date._seconds + audit.date._nanoseconds}
              >
                <td className="px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white">
                  {/* Date */}
                  {new Intl.DateTimeFormat('en-GB', {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit',
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit'
                  }).format(new Date(audit.date._seconds * 1000)).replace(/\//g, '.')}


                </td>
                <td className="px-6 py-4">
                  {audit.messageType === 'INFO' ? (
                    <p style={{ fontSize: 19 }} className="text-primary-500 font-medium">
                      Informative
                    </p>
                  ) : audit.messageType === 'WARNING' ? (
                    <p style={{ fontSize: 19 }} className="text-yellow-600 font-medium">
                      Warning
                    </p>
                  ) : (
                    <p style={{ fontSize: 19 }} className="text-red-700 font-medium">
                      Error
                    </p>
                  )}
                </td>
                <td className="px-6 py-4">{audit.message}</td>
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

export default AuditLog;
