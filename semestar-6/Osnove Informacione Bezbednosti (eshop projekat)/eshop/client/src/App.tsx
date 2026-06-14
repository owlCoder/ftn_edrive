import { Route, Routes } from "react-router-dom";
import { ProtectedRoute } from "./components/protected_route/ProtectedRoute";
import { AuthPage } from "./pages/AuthPage";
import { IAuthAPI } from "./api/auth/IAuthAPI";
import { AuthAPI } from "./api/auth/AuthAPI";
import { UserAPI } from "./api/users/UserAPI";
import { DashboardPage } from "./pages/DashboardPage";
import { IPlantAPI } from "./api/plants/IPlantAPI";
import { PlantAPI } from "./api/plants/PlantAPI";
import { IUserAPI } from "./api/users/IUserAPI";

const auth_api: IAuthAPI = new AuthAPI();
const user_api: IUserAPI = new UserAPI();
const plant_api: IPlantAPI = new PlantAPI();

function App() {
  return (
    <>
      <Routes>
        <Route
          path="/dashboard"
          element={
            <ProtectedRoute requiredRole="admin,seller">
              <DashboardPage userAPI={user_api} plantAPI={plant_api} />
            </ProtectedRoute>
          }
        />
        <Route path="/" element={<AuthPage authAPI={auth_api} />} />
      </Routes>
    </>
  );
}

export default App;
