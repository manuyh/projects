import { writable } from "svelte/store";

const a = writable({ code: "", selectedText: "" });
const b = writable({ code: "", selectedText: "" });
const c = writable({ code: "", selectedText: "" });
const d = writable({ code: "", selectedText: "" });
const part2 = writable({ code: "", selectedText: "" });

const timeA = writable(null);
const timeUnitA = writable(null);
const timeB = writable(null);
const timeUnitB = writable(null);
const timeC = writable(null);
const timeUnitC = writable(null);
const timeD = writable(null);
const timeUnitD = writable(null);
const timePart2 = writable(null);
const timeUnitPart2 = writable(null);

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
          .replace(/([^0-9a-zA-ZñÑ&\/\s])/g, "")
          .toUpperCase()
      ),
  };
}

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
