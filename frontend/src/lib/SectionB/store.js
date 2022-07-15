import { stringStore, objectStore } from "../../stores";

const surgery = objectStore(null);
const surgeryDate = objectStore(null);
const autopsy = objectStore(null);
const usedFoundings = objectStore(null);
const mannerOfDeath = objectStore(null);
const placeOfDeath = objectStore(null);
const multiplePregnancy = objectStore(null);
const stillborn = objectStore(null);
const hoursAlive = objectStore(null);
const weightInGrams = objectStore(null);
const fullWeeksOfPregnancy = objectStore(null);
const motherAgeInYears = objectStore(null);
const womanPregnantCondition = objectStore("");
const pregnancyContributionToDeath = objectStore("");

const surgeryReason = stringStore("", 2);
const placeOfDeathOther = stringStore("", 2);

export {
  surgery,
  surgeryDate,
  surgeryReason,
  autopsy,
  usedFoundings,
  mannerOfDeath,
  placeOfDeath,
  placeOfDeathOther,
  multiplePregnancy,
  stillborn,
  hoursAlive,
  weightInGrams,
  fullWeeksOfPregnancy,
  motherAgeInYears,
  womanPregnantCondition,
  pregnancyContributionToDeath,
};
