import { stringStore, objectStore } from "../../stores";

const a = objectStore({ code: "", selectedText: "" });
const b = objectStore({ code: "", selectedText: "" });
const c = objectStore({ code: "", selectedText: "" });
const d = objectStore({ code: "", selectedText: "" });
const part2 = objectStore({ code: "", selectedText: "" });

const timeA = objectStore(null);
const timeUnitA = objectStore(null);
const timeB = objectStore(null);
const timeUnitB = objectStore(null);
const timeC = objectStore(null);
const timeUnitC = objectStore(null);
const timeD = objectStore(null);
const timeUnitD = objectStore(null);
const timePart2 = objectStore(null);
const timeUnitPart2 = objectStore(null);

const causeOfDeath = stringStore();
const aditionalCode = stringStore();

export {
  a,
  b,
  c,
  d,
  part2,
  timeA,
  timeUnitA,
  timeB,
  timeUnitB,
  timeC,
  timeUnitC,
  timeD,
  timeUnitD,
  timePart2,
  timeUnitPart2,
  causeOfDeath,
  aditionalCode,
};
