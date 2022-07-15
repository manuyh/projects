import { writable } from "svelte/store";

const stringStore = (initValue = "", regex = 1) => {
  const { subscribe, update, set } = writable(initValue);

  const regexes = {
    1: /([^0-9a-zA-ZñÑ&\/\s])/g,
    2: /([^0-9a-zA-ZñÑ\/\(\)\-\,\.\s])/g,
  };

  return {
    subscribe,
    reset: () => set(initValue),
    set: (id) =>
      update(() =>
        id
          .replace(/[áÁ]/, "A")
          .replace(/[éÉ]/, "E")
          .replace(/[íÍ]/, "I")
          .replace(/[óÓ]/, "O")
          .replace(/[úÚ]/, "U")
          .replace(regexes[regex], "")
          .toUpperCase()
      ),
  };
};

const objectStore = (initValue = null) => {
  const { subscribe, update, set } = writable(initValue);

  return {
    subscribe,
    update,
    set,
    reset: () => set(initValue),
  };
};

export { stringStore, objectStore };
