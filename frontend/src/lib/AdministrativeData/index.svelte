<script>
  export let genders;
  export let ageUnits;

  import Textfield from "@smui/textfield";
  import HelperText from "@smui/textfield/helper-text";
  import Tooltip, { Wrapper } from "@smui/tooltip";
  import { Cell, InnerGrid } from "@smui/layout-grid";
  import Card, { Content } from "@smui/card";
  import moment from "moment";

  import Select from "../Select.svelte";
  import InputNumber from "../InputNumber.svelte";
  import Date from "../Date.svelte";
  import config from "../../config";

  import {
    identifier,
    gender,
    age,
    ageUnit,
    birthdate,
    deathdate,
    variable1,
    variable2,
  } from "./store";

  $: {
    if ($birthdate !== null && $deathdate !== null) {
      const bd = moment($birthdate);
      const dd = moment($deathdate);

      const years = parseInt(moment.duration(dd.diff(bd)).asYears(), 10);

      // Set for only for years
      if (years > 0) {
        age.set(years);
        ageUnit.set({ identifier: 5 });
      }
    }
  }
</script>

<Card>
  <Content class="mdc-typography--body2">
    <InnerGrid>
      <Cell span={12}>
        <h2 class="mdc-typography--headline6" style="margin: 0;">
          Datos Administrativos
        </h2>
      </Cell>
      <Cell span={12}>
        <Textfield
          bind:value={$identifier}
          label="ID"
          type="number"
          style="width: 100%;"
        />
      </Cell>
      <Cell span={4}>
        <Select label="Sexo" items={genders} value={gender} />
      </Cell>
      <Cell span={4}>
        <InputNumber label="Edad (número)" value={age} unit={ageUnit} />
      </Cell>
      <Cell span={4}>
        <Select label="Edad" items={ageUnits} value={ageUnit} />
      </Cell>
      <Cell span={6}>
        <Date value={birthdate} label="Fecha de nacimiento" />
      </Cell>
      <Cell span={6}>
        <Date value={deathdate} label="Fecha de defunción" />
      </Cell>
      <Cell span={12}>
        <Textfield
          bind:value={$variable1}
          label="Variable 1"
          style="width: 100%;"
        />
      </Cell>
      <Cell span={12}>
        <Textfield
          bind:value={$variable2}
          label="Variable 2"
          style="width: 100%;"
        />
      </Cell>
    </InnerGrid>
  </Content>
</Card>
