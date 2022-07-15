import { stringStore, objectStore } from "../../stores";

const identifier = objectStore(null);
const gender = objectStore(null);
const age = objectStore(null);
const ageUnit = objectStore(null);
const birthdate = objectStore(null);
const deathdate = objectStore(null);
const variable1 = stringStore("", 2);
const variable2 = stringStore("", 2);

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
