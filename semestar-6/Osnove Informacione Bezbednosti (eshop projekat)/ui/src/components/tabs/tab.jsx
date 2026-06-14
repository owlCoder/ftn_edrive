import React, { useState, useEffect } from "react";
import {
  FaUsers,
  FaShoppingCart,
  FaBoxOpen,
  FaClipboardList,
} from "react-icons/fa";
import UsersTab from "../admin/userTab";
import AuditLog from "../admin/auditTab";
import OrdersTab from "../admin/OrdersTab";
import ProductsTab from "../admin/ProductsTab";

const Tabs = () => {
  const [activeTab, setActiveTab] = useState("users");
  const [tabContent, setTabContent] = useState(null);

  const tabItems = [
    { id: "users", label: "Users", icon: <FaUsers className="inline mr-2" /> },
    { id: "products", label: "Products", icon: <FaBoxOpen className="inline mr-2" /> },
    { id: "orders", label: "Orders", icon: <FaShoppingCart className="inline mr-2" /> },
    { id: "audit", label: "Audit", icon: <FaClipboardList className="inline mr-2" /> },
  ];

  const handleTabClick = (tabId) => {
    if (activeTab !== tabId) {
      setActiveTab(tabId);
    } else {
      setActiveTab(null); // Reload tab content on click
    }
  };

  useEffect(() => {
    // Load tab content when the active tab changes
    switch (activeTab) {
      case "users":
        setTabContent(<UsersTab />);
        break;
      case "products":
        setTabContent(<ProductsTab />);
        break;
      case "orders":
        setTabContent(<OrdersTab />);
        break;
      case "audit":
        setTabContent(<AuditLog />);
        break;
      default:
        setTabContent(null);
        break;
    }
  }, [activeTab]);

  return (
    <div>
      <div className="p-2 flex ml-4">
        <div className="bg-slate-100 dark:text-white dark:bg-slate-800 border-2 dark:border-slate-900 px-4 py-3 bg-opacity-60 rounded-lg max-w-md shadow-lg overflow-hidden">
          <div className="max-w-sm mx-auto flex justify-between items-center">
            {tabItems.map((item) => (
              <div
                key={item.id}
                className={`cursor-pointer py-2 px-3 rounded-lg
                  ${activeTab === item.id
                    ? "text-slate-100 bg-blue-900 dark:bg-blue-700 bg-opacity-80 dark:bg-opacity-50"
                    : "bg-opacity-40 hover:bg-opacity-60"}
                `}
                onClick={() => handleTabClick(item.id)}
              >
                {item.icon}
                {item.label}
              </div>
            ))}
          </div>
        </div>
      </div>
      {/* Render tab content based on activeTab */}
      <div className={activeTab ? "block" : "hidden"}>{tabContent}</div>
    </div>
  );
};

export default Tabs;
