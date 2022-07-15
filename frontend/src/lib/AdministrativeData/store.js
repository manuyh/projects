import { writable } from "svelte/store";

function stringStore() {
  const { subscribe, update } = writable("");

  return {
    subscribe,
    set: (id) =>
      update(() =>
        id
          .replace(/[áÁ]/, "A")
          .replace(/[éÉ]/, "E")
          .replace(/[íÍ]/, "I")
          .replace(/[óÓ]/, "O")
          .replace(/[úÚ]/, "U")
          .replace(/([^0-9a-zA-ZñÑ\/\(\)\-\,\.\s])/g, "")
          .toUpperCase()
      ),
  };
}

const identifier = writable(null);
const gender = writable(null);
const age = writable(null);
const ageUnit = writable(null);
const birthdate = writable(null);
const deathdate = writable(null);
const variable1 = stringStore();
const variable2 = stringStore();

export {
  identifier,
  gender,
  age,
  ageUnit,
  birthdate,
  deathdate,
  variable1,
  variable2,
};
