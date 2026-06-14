import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import { useAuth } from "../../contexts/AuthContext";
import axios from "axios";
import Navbar from "../navigation/Navbar";
import Tabs from "../tabs/tab";
import LoadingSpinner from "../loading/loading";

export default function Dashboard() {
    const navigate = useNavigate();
    const { currentUser } = useAuth();
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        setLoading(true);
        const fetchData = async () => {
            if (!currentUser) {
                navigate("/login");
                return;
            }

            try {
                const token = await currentUser.getIdToken();
                const response = await axios.post(
                    global.APIEndpoint + "/api/user/getById",
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

                if (global.WM === "WM_UNRESTRICTED") // unsecure
                    setLoading(false);
                else if(response.status === 200 && global.WM === "WM_SECURE" && response.data.payload.role === "admin") // secure
                    setLoading(false);
                else
                    navigate('/403');

            } catch (error) {
                navigate('/403')
            }
        };

        fetchData();
    }, [currentUser, navigate]);

    return loading === true ? (
        <LoadingSpinner />
    ) : currentUser ? (
        <div className="bg-gray-100 dark:bg-gray-900 min-h-screen pb-5">
            <Navbar />
            <div className="bg-gray-100 dark:bg-gray-900 min-h-screen mt-20">
                <Tabs /> {/* Render the Tabs component here */}
            </div>
        </div>
    ) : (
        <div></div>
    );
}
