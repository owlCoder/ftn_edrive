import { React } from "react";

export const Card = ({ year, title, hyperlink, hyperlinkText }) => {

    return (
        <div className="relative rounded-2xl overflow-hidden shadow-2xl">
            {/* Image div */}
            <div className="bg-blue-500">
              <img className="" src="https://musicbox.co.rs/images/1.vr7_resize.jpg" alt="" />
            </div>
            
            {/* Text div */}
            <div className="max-size-sm absolute bottom-10 left-0 lg:right-1/4 right-0 py-6 px-3 text-black bg-white bg-opacity-70 dark:bg-slate-900 bg dark:bg-opacity-90 dark:text-white lg:rounded-r-2xl rounded-none">
              <div className="flex justify-between w-full">
                  <div className="font-normal flex flex-col items-start space-y-3">
                    <div className="inline-block px-3 py-1 text-sm text-white bg-black rounded-full">
                        {year}
                    </div>
                    <div className="flex flex-col items-start space-y-3 ">
                      <p className="2xl:text-2xl xl:text-2xl lg:text-2xl md:text-xl text-2xl">{title}</p>
                      <a href={hyperlink} className="bg-blue-600 uppercase hover:bg-blue-700 text-white px-3 py-2 rounded-md text-sm font-medium">
                        {hyperlinkText}
                      </a>
                    </div>
                  </div>
              </div>
            </div>
          </div>    
    );
};