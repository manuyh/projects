<script>
  export let basicResponses;
  export let mannerOfDeath;
  export let placeOfDeath;
  export let womanPregnantCondition;

  import Card, { Content } from "@smui/card";
  import { Cell, InnerGrid } from "@smui/layout-grid";
  import Select from "../Select.svelte";
  import Textfield from "@smui/textfield";

  import Date from "../Date.svelte";
  import {
    surgery,
    surgeryDate,
    surgeryReason,
    autopsy,
    usedFoundings,
    mannerOfDeath as mannerOfDeathValue,
    placeOfDeath as placeOfDeathValue,
    placeOfDeathOther,
    multiplePregnancy,
    stillborn,
    hoursAlive,
    weightInGrams,
    fullWeeksOfPregnancy,
    motherAgeInYears,
    womanPregnantCondition as womanPregnantConditionValue,
    pregnancyContributionToDeath,
  } from "./store";

  let disabledSurgery = true;
  $: {
    if ($surgery?.identifier === 1) {
      disabledSurgery = false;
    } else {
      disabledSurgery = true;
    }
  }

  let disabledAutopsy = true;
  $: {
    if ($autopsy?.identifier === 1) {
      disabledAutopsy = false;
    } else {
      disabledAutopsy = true;
    }
  }

  let disabledMannerOfDeath = true;
  $: {
    if ($mannerOfDeathValue?.identifier !== 0) {
      disabledMannerOfDeath = false;
    } else {
      disabledMannerOfDeath = true;
    }

    if ($mannerOfDeathValue === undefined) {
      disabledMannerOfDeath = true;
    }
  }

  let disabledPlaceOfDeathOther = true;
  $: {
    if ($placeOfDeathValue?.identifier === 8) {
      disabledPlaceOfDeathOther = false;
    } else {
      disabledPlaceOfDeathOther = true;
    }

    if ($placeOfDeathValue === undefined) {
      disabledPlaceOfDeathOther = true;
    }
  }

  let disabledHoursAlive = true;
  $: {
    if ($hoursAlive <= 0 && !disabledHoursAlive) {
      hoursAlive.set(0);
    }

    if ($hoursAlive >= 24) {
      hoursAlive.set(24);
    }

    if ($multiplePregnancy?.identifier === 1 || $stillborn?.identifier === 1) {
      disabledHoursAlive = false;
    } else {
      disabledHoursAlive = true;
    }
  }

  $: {
    if ($fullWeeksOfPregnancy <= 0 && !disabledHoursAlive) {
      fullWeeksOfPregnancy.set(0);
    }

    if ($motherAgeInYears <= 0) {
      motherAgeInYears.set(0);
    }
  }

  let disabledPregnancyContributionToDeath = true;
  $: {
    if ($womanPregnantConditionValue?.identifier === 8) {
      disabledPregnancyContributionToDeath = false;
    } else {
      disabledPregnancyContributionToDeath = true;
    }

    if ($womanPregnantConditionValue === undefined) {
      disabledPregnancyContributionToDeath = true;
    }
  }
</script>

<Card>
  <Content>
    <InnerGrid>
      <Cell span={12}>
        <h2 class="mdc-typography--headline6" style="margin: 0;">
          Secci??n B Otra informaci??n m??dica
        </h2>
      </Cell>
      <Cell span={12}>
        <Card>
          <Content>
            <InnerGrid>
              <Cell span={12}>
                <h3 class="mdc-typography--headline6" style="margin: 0;">
                  Cirug??a
                </h3>
              </Cell>
              <Cell span={12}>
                <Select
                  label="Se practic?? alguna cirug??a en las ??ltimas 4 semanas"
                  items={basicResponses}
                  value={surgery}
                />
              </Cell>
              <Cell span={12}>
                <Date
                  value={surgeryDate}
                  label="Si la respuesta es s??, especifique la fecha de la cirug??a"
                  disabled={disabledSurgery}
                />
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="Si la respuesta es s??, especifique el motivo de la cirug??a (enfermedad o afecci??n)"
                  bind:value={$surgeryReason}
                  style="width:100%;"
                  disabled={disabledSurgery}
                />
              </Cell>
              <Cell span={12}>
                <Select
                  label="??Se solicit?? una autopsia?"
                  items={basicResponses}
                  value={autopsy}
                />
              </Cell>
              <Cell span={12}>
                <Select
                  label="Si la respuesta es S??, ??fueron los hallazgos utilizados en la certificaci??n?"
                  items={basicResponses}
                  value={usedFoundings}
                  disabled={disabledAutopsy}
                />
              </Cell>
            </InnerGrid>
          </Content>
        </Card>
      </Cell>
      <Cell span={12}>
        <Card>
          <Content>
            <InnerGrid>
              <Cell span={12}>
                <h3 class="mdc-typography--headline6" style="margin: 0;">
                  Manera de Morir
                </h3>
              </Cell>
              <Cell span={12}>
                <Select
                  label="Manera de morir"
                  items={mannerOfDeath}
                  value={mannerOfDeathValue}
                />
              </Cell>
              <Cell span={12}>
                <Date
                  value={surgeryDate}
                  label="Fecha de la lesi??n"
                  disabled={disabledMannerOfDeath}
                />
              </Cell>
              <Cell span={12}>
                <h4 class="mdc-typography--subtitle2" style="margin: 0;">
                  Si es causa externa o envenenamiento
                </h4>
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="Describa como se produjo la causa externa (??hay intoxicaci??n?, indique sustancia)"
                  bind:value={$surgeryReason}
                  style="width:100%;"
                  disabled={disabledMannerOfDeath}
                />
              </Cell>
              <Cell span={12}>
                <Select
                  label="Lugar de ocurrencia de la causa externa"
                  items={placeOfDeath}
                  value={placeOfDeathValue}
                  disabled={disabledMannerOfDeath}
                />
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="Si fue otro lugar (especifique)"
                  bind:value={$placeOfDeathOther}
                  style="width:100%;"
                  disabled={disabledPlaceOfDeathOther}
                />
              </Cell>
            </InnerGrid>
          </Content>
        </Card>
      </Cell>
      <Cell span={12}>
        <Card>
          <Content>
            <InnerGrid>
              <Cell span={12}>
                <h3 class="mdc-typography--headline6" style="margin: 0;">
                  Muerte fetal o infantil
                </h3>
              </Cell>
              <Cell span={12}>
                <Select
                  label="Embarazo m??ltiple"
                  items={basicResponses}
                  value={multiplePregnancy}
                />
              </Cell>
              <Cell span={12}>
                <Select
                  label="Muerte fetal"
                  items={basicResponses}
                  value={stillborn}
                />
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="Si fallece dentro de las 24 hrs, n??mero de horas sobrevividas"
                  bind:value={$hoursAlive}
                  type="number"
                  style="width:100%;"
                  disabled={disabledHoursAlive}
                />
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="Peso al nacer (gramos)"
                  bind:value={$weightInGrams}
                  type="number"
                  style="width:100%;"
                  disabled={disabledHoursAlive}
                />
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="N??mero de semanas completas de embarazo"
                  bind:value={$fullWeeksOfPregnancy}
                  type="number"
                  style="width:100%;"
                  disabled={disabledHoursAlive}
                />
              </Cell>
              <Cell span={12}>
                <Textfield
                  label="Edad de la madre (a??os)"
                  bind:value={$motherAgeInYears}
                  type="number"
                  style="width:100%;"
                />
              </Cell>
            </InnerGrid>
          </Content>
        </Card>
      </Cell>
      <Cell span={12}>
        <Card>
          <Content>
            <InnerGrid>
              <Cell span={12}>
                <h3 class="mdc-typography--headline6" style="margin: 0;">
                  Para las mujeres
                </h3>
              </Cell>
              <Cell span={12}>
                <Select
                  label="??Estaba embarazada la fallecida?"
                  items={womanPregnantCondition}
                  value={womanPregnantConditionValue}
                />
              </Cell>
              <Cell span={12}>
                <Select
                  label="??El embarazo contribuy?? a la muerte?"
                  items={basicResponses}
                  value={pregnancyContributionToDeath}
                  disabled={disabledPregnancyContributionToDeath}
                />
              </Cell>
            </InnerGrid>
          </Content>
        </Card>
      </Cell>
    </InnerGrid>
  </Content>
</Card>
