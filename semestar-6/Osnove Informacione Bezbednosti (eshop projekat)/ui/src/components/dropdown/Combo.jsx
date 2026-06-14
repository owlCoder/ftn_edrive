import { Fragment, useState } from "react";
import { Combobox, Transition } from "@headlessui/react";
import { IoIosArrowDown, IoIosClose } from "react-icons/io";
import { FaCheck } from "react-icons/fa";

export default function Combo({ genresArr, setter }) {

  const [query, setQuery] = useState(""); 
  const [selected, setSelected] = useState([]);

  const filteredGenres =
    query === ""
      ? genresArr
      : genresArr.filter((genre) =>
          genre.name
            .toLowerCase()
            .replace(/\s+/g, "")
            .includes(query.toLowerCase().replace(/\s+/g, ""))
        );
    const handleSelection = (item) => {
      setSelected([...selected, item]);
      setter([...selected, item]);
    };
    
    const handleRemoveSelection = (item) => {
      const updatedSelected = selected.filter((selectedItem) => selectedItem.id !== item.id);
      setSelected(updatedSelected);
      setter(updatedSelected);
      
    };

  return (
    <div className="w-full">
      <Combobox value={selected} onChange={setSelected} multiple>
        <div className="relative mt-1 h-14">
          <div className="relative w-full cursor-default overflow-hidden rounded-lg bg-white dark:bg-slate-700 text-left shadow-md focus:outline-none focus-visible:ring-2 focus-visible:ring-white/75 focus-visible:ring-offset-2 focus-visible:ring-offset-teal-300 text-sm">
            {selected.length > 0 && (
              <div className="ml-2 space-x-1 flex flex-wrap  items-center mr-8">
                {selected.map((item) => (
                  <div key={item.id} onClick={() => handleRemoveSelection(item)} className="cursor-pointer flex items-center text-gray-400 hover:text-white hover:border-white text-xs border border-gray-400 rounded-full px-2 py-0.5 pb-1 my-0.5 ">
                    <button
                      type="button"                      
                      className="focus:outline-none"
                    >
                      {item.name}
                    </button>
                    <span>
                      <IoIosClose />
                    </span>
                  </div>
                ))}
              </div>
            )}
            <Combobox.Input
              className="w-full border-none h-10 p-2 text-sm leading-5 text-gray-900 focus:ring-0 dark:bg-slate-700 dark:text-gray-300 outline-none"
              displayValue={() => ""}
              onChange={(event) => setQuery(event.target.value)}          
            />
            <Combobox.Button className="absolute inset-y-0 right-0 flex items-center pr-2">
              <IoIosArrowDown className="h-5 w-5 text-gray-400" aria-hidden="true" />
            </Combobox.Button>
          </div>
          <Transition
            as={Fragment}
            leave="transition ease-in duration-100"
            leaveFrom="opacity-100"
            leaveTo="opacity-0"
            afterLeave={() => setQuery("")}
          >
            <Combobox.Options className="absolute mt-1 2xl:max-h-40 lg:max-h-20 max-h-56 w-full overflow-auto divide-y divide-gray-100 rounded-md bg-white dark:bg-gray-800 dark:divide-gray-700 ring-black ring-opacity-5 py-1 text-base shadow-lg ring-1 ring-black/5 focus:outline-none sm:text-sm">
              {filteredGenres.length === 0 && query !== "" ? (
                <div className="relative cursor-default select-none px-4 py-2 text-gray-700">
                  Nothing found.
                </div>
              ) : (
                filteredGenres.map((genre) => (
                  <Combobox.Option
                    key={genre.id}
                    className={({ active }) =>
                      `relative cursor-default select-none py-2 pl-10 pr-4 dark:text-white ${
                        active ? "dark:bg-gray-900 dark:text-gray-300" : ""
                      }`
                    }
                    value={genre}
                    onClick={() => handleSelection(genre)}
                  >
                    {({ selected, active }) => (
                      <>
                        <span
                          className={`block truncate ${
                            selected ? "font-medium" : "font-normal"
                          }`}
                        >
                          {genre.name}
                        </span>
                        {selected ? (
                          <span
                            className={`absolute inset-y-0 left-0 flex items-center pl-3 ${
                              active ? "text-white" : "text-teal-600"
                            }`}
                          >
                            <FaCheck />
                          </span>
                        ) : null}
                      </>
                    )}
                  </Combobox.Option>
                ))
              )}
            </Combobox.Options>
          </Transition>
        </div>
      </Combobox>
    </div>
  );
}