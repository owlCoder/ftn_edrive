import { useNavigate } from "react-router-dom";
import { useState, useEffect, useRef } from "react";
import axios from "axios";
import imageCompression from 'browser-image-compression';
import { useAuth } from "../../contexts/AuthContext";
import Navbar from "../navigation/Navbar";
import LoadingSpinner from "../loading/loading";
import Combo from "../dropdown/Combo";

function New() {
    const navigate = useNavigate();
    const { currentUser } = useAuth();
    const [loading, setLoading] = useState(true);
    const [currYear, setCurrYear] = useState("");
    const [currYear2, setCurrYear2] = useState("");
    const [comboGenres, setComboGenres] = useState([]);
    const [error, setError] = useState("");

    const initialData = {
        author: "",
        dateValidity: "",
        genres: [],
        name: "",
        photoBase64: "",
        price: -1,
        productionYear: "",
        quantity: -1,
        sellerUid: currentUser["uid"],
        used: false,
    }

    const [form, setForm] = useState(
        initialData   
    )

    const handleChange = (e) => {
        setForm({
            ...form,
            [e.target.name]: e.target.value,
        });

    };

    const [showModal, setShowModal] = useState(false);
    const [isModalVisible, setIsModalVisible] = useState(false);
    const [modalText, setModalText] = useState("");
    const [modalDesc, setModalDesc] = useState("");

    const [selected, setSelected] = useState([]);

    const [selectedImage, setSelectedImage] = useState(null);
    const imageRef = useRef(null);

    function clearForm(){
        
        form.genres = [];
    }

    useEffect(() => {
        setLoading(true);

        const fetchData = async () => {
            if (!currentUser) {
                navigate("/login");
                return;
            }

            setLoading(false);           
        };

        const fetchGenres = async () => {
            try {
              const response = await axios.get(
                global.APIEndpoint + "/api/genre/get",
                {
                  headers: {
                    "Content-Type": "application/json",
                  },
                }
              );
      
              if (response.status === 200) {
                setComboGenres(response.data.payload);
              }
                    

            } catch (error) {
              navigate("/403");
            }
        };

        var currentDate = new Date();
        var currentDate2 = new Date();
        currentDate2 = `${currentDate2.getFullYear()}-${currentDate2.getMonth() + 1 }-${currentDate2.getDate()}`;
        setCurrYear2(currentDate2);
        

        var allowedYear = currentDate.getFullYear();
        var formattedDate = `${allowedYear}-01-01`;
        setCurrYear(formattedDate);

        fetchData();
        fetchGenres();        

    }, [currentUser]);


    const handleAddClick = async (e) => {
        
        e.preventDefault();
        setError("");
        console.log(form); 

        form.genres = selected;

        if (form.name.trim().length === 0) {
            setError("Name field can't be empty");
        }
        else if (form.author.trim().length === 0) {
           setError("Author field can't be empty");
        }
        else if (form.productionYear.length === 0) {
            setError("Year of production field can't be empty");  
        }
        else if(form.productionYear.length !==4 || parseInt(form.productionYear) < 1887 || parseInt(form.productionYear) > parseInt(currYear.substring(0, 4))){
            setError("Year of production not valid");
        }
        else if(form.genres.length < 1){
            setError("Pick genres");
        }
        else if (form.price === -1) {
            setError("Price field can't be empty");
        }
        else if(parseFloat(form.price) < 0){
            setError("Price can't be negative number");
        }
        else if (form.quantity === -1) {
            setError("Quantity field can't be empty");
        }
        else if(parseFloat(form.quantity) < 0){
            setError("Quantity can't be negative number");
        }
        else if(form.dateValidity === ""){
            setError("Product must have expiry date")
        }
        else if(selectedImage === null){    
            setError("Product must have an image");
        }
        

        else{
            try {
                const token = await currentUser.getIdToken();            
    
                const response = await axios.post(
                    global.APIEndpoint + "/api/product/create",
                    {
                        form
                    },
                    {
                        headers: {
                            Authorization: `${token}`,
                            "Content-Type": "application/json",
                        },
                    }
                ); 
                
                if(response.data.code === 200){
                    console.log("+");
                    clearForm();
                }
                else{
                    console.log("-");
                }
    
            } catch (error) {
                //navigate('/403')
            }
            
            setModalText("Product added");
            setModalDesc("New item has been posted.");
            setShowModal(true);   

            
            console.log(form);
            console.log("init Data " + initialData);
        }
         
    };

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
                setSelectedImage(base64String);
      
                form.photoBase64 = base64String;

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
  
            if(form.photoBase64 === "") {
                setSelectedImage(null);  
                if (imageRef.current) {
                    imageRef.current.src = "https://musicbox.co.rs/images/1.vr7_resize.jpg";
                }                 
            }
            else{
                if (imageRef.current) {
                    imageRef.current.src = form.photoBase64;
                }
            }
                    
        }
    };


    const handleGotItClick = () => {
        setShowModal(false);
    };

   

    return loading === true ? (
        <LoadingSpinner />
    ) : currentUser ? (
        <div className="bg-gray-100 dark:bg-slate-800 min-h-screen pb-5">
            <Navbar />
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
            
            <div className="flex justify-center items-center mt-32 pb-6">
                <div className="dark:text-white dark:bg-gray-900 mx-10 rounded-2xl p-12 px-20 pt-6 shadow-2xl flex flex-col items-end lg:w-4/5">
                    
                    {/* All Content */}
                    <div className="lg:p-12 md:p-24 w-full">
                    
                        { /* Title */}
                        <div className="lg:text-start text-center">
                            <p className="text-3xl mb-6">Add new product</p>
                        </div>                    

                        <form>
                            <div className="flex flex-col lg:space-x-10 lg:flex-row space-y-12 lg:space-y-0 lg:divide-none divide-y dark:divide-gray-200">
                        
                                {/* Image */}
                                <div className="flex flex-col space-y-3 justify-center">                                   
                                    <div className="overflow-hidden rounded-lg mx-auto">
                                        <img
                                            ref={imageRef}
                                            className="hover:scale-105 duration duration-300 w-52 max-h-52 "
                                            src="https://musicbox.co.rs/images/1.vr7_resize.jpg"
                                            alt=""
                                        />
                                    </div>
                                    
                                    <div className="flex flex-col items-center">
                                        <h3 className="mb-1 text-xl font-bold text-gray-900 dark:text-white">
                                            Product picture
                                        </h3>
                                        <div className="mb-4 text-sm text-gray-500 dark:text-gray-400">
                                            JPG or PNG. Max file size of 800Kb
                                        </div>
                                        <div className="flex items-center space-x-4">
                                            <div className="mr-2">
                                                <input type="file" accept="image/*" id="imageInput" onChange={handleImageChange} style={{display: "none"}} />
                                                <label htmlFor="imageInput" className="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-emerald-700 hover:bg-emerald-800 focus:ring-4 focus:ring-emerald-300 dark:bg-emerald-600 dark:hover:bg-emerald-700 dark:focus:ring-emerald-800" style={{cursor: "pointer"}}>
                                                    Select an Image
                                                </label>
                                            </div>                                        
                                        </div>
                                    </div>

                                </div>

                                {/* Info about Product */}
                                <div className="flex basis-1/3 flex-col space-y-5 ">
                                    
                                    {/* Title */}
                                    <div className="dark:text-white text-black text-2xl mt-6">
                                        <p className="">Product Info</p>
                                    </div>

                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label htmlFor="">Name:</label>
                                        <input type="text" name="name" onChange={handleChange} required className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"></input>
                                    </div>

                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label htmlFor="">Author:</label>
                                        <input type="text" name="author" onChange={handleChange} required className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"></input>
                                    </div>

                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label htmlFor="">Year of Production:</label>
                                        <input type="number" min={1887}  max={currYear} name="productionYear" onChange={handleChange} required className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none"></input>
                                    </div>

                                    
                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label>Genres:</label>                                                                             
                                        <Combo genresArr={comboGenres} setter={setSelected} />                                        
                                    </div>                                                                    
                                        
                                </div>

                                {/* Info about Order */}
                                <div className="flex basis-1/3 flex-col space-y-5">

                                    {/* Title */}
                                    <div className="dark:text-white text-black text-2xl mt-6">
                                        <p className="">Order Info</p>
                                    </div>                                

                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label htmlFor="">Price:</label>
                                        <input required type="number" name="price" onChange={handleChange} className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none"></input>
                                    </div>                        

                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label htmlFor="">Quantity:</label>
                                        <input required type="number"  name="quantity" onChange={handleChange} className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none"></input>
                                    </div>

                                    <div className="flex flex-col space-y-2 justify-center">
                                        <label htmlFor="">Available untill:</label>
                                        <input required type="date" min={currYear2}  name="dateValidity" onChange={handleChange} className="w-full p-2 bg-white border-primary-800 dark:bg-slate-700 text-black dark:text-white rounded-lg shadow-md outline-none"></input>
                                    </div>
                                    
                                    <div className="flex">                                                                                
                                        <div className="flex flex-col">
                                            <div className="flex items-center mb-4">
                                                <input defaultChecked id="default-radio-1" type="radio" value="" name="used" onClick={() => {form.used = false}} className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                                                <label htmlFor="default-radio-1" className="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">New</label> 
                                            </div>
                                            <div className="flex items-center">
                                                <input id="default-radio-2" type="radio" value="" name="used" onClick={() => {form.used = true}} className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                                                <label htmlFor="default-radio-2" className="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Used</label>
                                            </div>
                                        </div>
                                                                             
                                    </div>
                                    
                                        
                                </div>
                            </div>    
                        </form>
                    </div>

                    <div className="flex gap-5">
                        <h4 className="text-red-700 dark:text-red-400 mt-4 mb-5">{error}</h4>
                        <div className="">
                            <button type="button" onClick={handleAddClick} className="mx-auto inline-flex items-center px-6 py-2 text-lg font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 1024 1024" className="plus-icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M482 152h60q8 0 8 8v704q0 8-8 8h-60q-8 0-8-8V160q0-8 8-8Z"></path><path d="M192 474h672q8 0 8 8v60q0 8-8 8H160q-8 0-8-8v-60q0-8 8-8Z"></path>
                                </svg>
                                Add
                            </button>
                        </div>
                    </div>
                                        

                </div>
            </div>
        </div>
    ) : (
        <div></div>
    );
}

export default New;