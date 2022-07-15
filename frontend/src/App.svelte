<script>
  import { onMount } from "svelte";
  import moment from "moment";
  import Button, { Label } from "@smui/button";
  import Card, { Content } from "@smui/card";
  import IconButton from "@smui/icon-button";
  import LayoutGrid, { Cell } from "@smui/layout-grid";
  import Select, { Option } from "@smui/select";
  import Textfield from "@smui/textfield";
  import TopAppBar, { Row, Section, Title } from "@smui/top-app-bar";
  import Snackbar, { Actions, Label as SnackLabel } from "@smui/snackbar";
  import "@material/typography/dist/mdc.typography.min.css";

  import AdministrativeData from "./lib/AdministrativeData/index.svelte";
  import SectionA from "./lib/SectionA/index.svelte";
  import SectionB from "./lib/SectionB/index.svelte";

  import {
    identifier,
    gender,
    age,
    ageUnit,
    birthdate,
    deathdate,
    variable1,
    variable2,
  } from "./lib/AdministrativeData/store";
  import {
    a,
    timeA,
    timeUnitA,
    b,
    timeB,
    timeUnitB,
    c,
    timeC,
    timeUnitC,
    d,
    timeD,
    timeUnitD,
    part2,
    timePart2,
    timeUnitPart2,
  } from "./lib/SectionA/store";
  import {
    surgery,
    surgeryDate,
    autopsy,
    usedFoundings,
    mannerOfDeath,
    placeOfDeath,
    multiplePregnancy,
    stillborn,
    hoursAlive,
    weightInGrams,
    fullWeeksOfPregnancy,
    motherAgeInYears,
    womanPregnantCondition,
    pregnancyContributionToDeath,
  } from "./lib/SectionB/store";

  import mexicanGobernment from "./assets/secretaria-de-salud.jpg";
  import vitalStrategies from "./assets/vital-strategies.jpg";
  import ops from "./assets/OPS-es.png";
  import "./styles.css";

  let genders = [];
  let ageUnits = [];
  let basicResponses = [];
  let mannerOfDeathOptions = [];
  let placeOfDeathOptions = [];
  let womanPregnantConditionOptions = [];

  const URL =
    import.meta.env.MODE === "development" ? "http://localhost:8080" : "";

  onMount(async () => {
    moment.locale("es-mx");

    const response = await fetch(`${URL}/api/catalogs`, {
      method: "POST",
    });

    const catalogs = await response.json();

    genders = catalogs.filter((c) => c.name === "gender");
    ageUnits = catalogs.filter((c) => c.name === "time-units");
    basicResponses = catalogs.filter((c) => c.name === "basic");
    mannerOfDeathOptions = catalogs.filter((c) => c.name === "manner-of-death");
    placeOfDeathOptions = catalogs.filter((c) => c.name === "place-of-death");
    womanPregnantConditionOptions = catalogs.filter(
      (c) => c.name === "pregnant-condition"
    );
  });

  let snackbarWithClose;

  const resetStores = () => {
    [
      identifier,
      gender,
      age,
      ageUnit,
      birthdate,
      deathdate,
      variable1,
      variable2,
      a,
      timeA,
      timeUnitA,
      b,
      timeB,
      timeUnitB,
      c,
      timeC,
      timeUnitC,
      d,
      timeD,
      timeUnitD,
      part2,
      timePart2,
      timeUnitPart2,
      surgery,
      surgeryDate,
      autopsy,
      usedFoundings,
      mannerOfDeath,
      placeOfDeath,
      multiplePregnancy,
      stillborn,
      hoursAlive,
      weightInGrams,
      fullWeeksOfPregnancy,
      motherAgeInYears,
      womanPregnantCondition,
      pregnancyContributionToDeath,
    ].forEach((store) => store.reset());
  };

  const sendInfo = async (event) => {
    const body = {
      identifier: $identifier,
      gender: $gender,
      age: $age,
      ageUnit: $ageUnit,
      birthdate: $birthdate,
      deathdate: $deathdate,
      variable1: $variable1,
      variable2: $variable2,
      a: $a,
      timeA: $timeA,
      timeUnitA: $timeUnitA,
      b: $b,
      timeB: $timeB,
      timeUnitB: $timeUnitB,
      c: $c,
      timeC: $timeC,
      timeUnitC: $timeUnitC,
      d: $d,
      timeD: $timeD,
      timeUnitD: $timeUnitD,
      part2: $part2,
      timePart2: $timePart2,
      timeUnitPart2: $timeUnitPart2,
      surgery: $surgery,
      surgeryDate: $surgeryDate,
      autopsy: $autopsy,
      usedFoundings: $usedFoundings,
      mannerOfDeath: $mannerOfDeath,
      placeOfDeath: $placeOfDeath,
      multiplePregnancy: $multiplePregnancy,
      stillborn: $stillborn,
      hoursAlive: $hoursAlive,
      weightInGrams: $weightInGrams,
      fullWeeksOfPregnancy: $fullWeeksOfPregnancy,
      motherAgeInYears: $motherAgeInYears,
      womanPregnantCondition: $womanPregnantCondition,
      pregnancyContributionToDeath: $pregnancyContributionToDeath,
    };

    const response = await fetch(`${URL}/api/store`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    });

    await response.json();

    snackbarWithClose.open();
    resetStores();
  };
</script>

<TopAppBar variant="static">
  <Row>
    <Section>
      <img
        class="mexican"
        src={mexicanGobernment}
        alt="Logo Gobierno de México"
      />
      <Title>Certificado de defunción internacional</Title>
      <img class="vital" src={vitalStrategies} alt="Logo de Vital Strategies" />
      <img
        class="ops"
        src={ops}
        alt="Logo de la Organización Panamericana de la Salud"
      />
    </Section>
  </Row>
</TopAppBar>
<LayoutGrid align="center" fixedColumnWidth>
  <Cell spanDevices={{ phone: 12, tablet: 12, desktop: 12 }}>
    <Card>
      <Content>
        <AdministrativeData {genders} {ageUnits} />
        <SectionA {ageUnits} />
        <SectionB
          {basicResponses}
          mannerOfDeath={mannerOfDeathOptions}
          placeOfDeath={placeOfDeathOptions}
          womanPregnantCondition={womanPregnantConditionOptions}
        />
        <section>
          <Button on:click={sendInfo}>
            <Label>Guardar información</Label>
          </Button>
        </section>
      </Content>
    </Card>
  </Cell>
</LayoutGrid>
<Snackbar bind:this={snackbarWithClose}>
  <SnackLabel>La información ha sido guardada.</SnackLabel>
  <Actions>
    <IconButton class="material-icons" title="Dismiss">close</IconButton>
  </Actions>
</Snackbar>

<style>
  img.mexican {
    width: 150px;
  }

  img.ops {
    width: 500px;
  }

  img.vital {
    width: 200px;
  }

  section {
    display: flex;
    justify-content: flex-end;
    margin-top: 3rem;
    width: 100%;
  }
</style>
