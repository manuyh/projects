<script>
  export let ageUnits;

  import Card, { Content } from "@smui/card";
  import { Cell, InnerGrid } from "@smui/layout-grid";
  import Textfield from "@smui/textfield";

  import Select from "../Select.svelte";
  import InputNumber from "../InputNumber.svelte";
  import Modal from "./Modal.svelte";
  import {
    a,
    b,
    c,
    d,
    part2,
    causeOfDeath,
    aditionalCode,
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
  } from "./store";

  let disabled = true;

  $: {
    if ($a.selectedText !== "") {
      disabled = false;
    } else {
      disabled = true;
    }
  }
</script>

<Card>
  <Content class="mdc-typography--body2">
    <InnerGrid>
      <Cell span={12}>
        <h2 class="mdc-typography--headline6" style="margin: 0;">
          Sección A Causas de defunción: Parte 1 y Parte 2
        </h2>
      </Cell>
      <Cell span={12}>
        <Card>
          <Content>
            <InnerGrid>
              <Cell span={12}>
                <h3 class="mdc-typography--headline6" style="margin: 0;">
                  Parte 1: Causa de la muerte
                </h3>
              </Cell>
              <Cell span={4}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$a.selectedText}
                  label=""
                />
              </Cell>
              <Cell span={2}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$a.code}
                  label="Código"
                  disabled
                />
              </Cell>
              <Cell span={2}>
                <InputNumber
                  label="Tiempo (número)"
                  value={timeA}
                  unit={timeUnitA}
                />
              </Cell>
              <Cell span={2}>
                <Select label="Tiempo" items={ageUnits} value={timeUnitA} />
              </Cell>
              <Cell span={2}>
                <Modal id={0} />
              </Cell>
              <Cell span={4}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$b.selectedText}
                  label="Debido a"
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$b.code}
                  label="Código"
                  disabled
                />
              </Cell>
              <Cell span={2}>
                <InputNumber
                  label="Tiempo (número)"
                  value={timeB}
                  unit={timeUnitB}
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Select
                  label="Tiempo"
                  items={ageUnits}
                  value={timeUnitB}
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Modal id={1} {disabled} />
              </Cell>
              <Cell span={4}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$c.selectedText}
                  label="Debido a"
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$c.code}
                  label="Código"
                  disabled
                />
              </Cell>
              <Cell span={2}>
                <InputNumber
                  label="Tiempo (número)"
                  value={timeC}
                  unit={timeUnitC}
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Select
                  label="Tiempo"
                  items={ageUnits}
                  value={timeUnitC}
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Modal id={2} {disabled} />
              </Cell>
              <Cell span={4}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$d.selectedText}
                  label="Debido a"
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$d.code}
                  label="Código"
                  disabled
                />
              </Cell>
              <Cell span={2}>
                <InputNumber
                  label="Tiempo (número)"
                  value={timeD}
                  unit={timeUnitD}
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Select
                  label="Tiempo"
                  items={ageUnits}
                  value={timeUnitD}
                  {disabled}
                />
              </Cell>
              <Cell span={2}>
                <Modal id={3} {disabled} />
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
                  Parte 2
                </h3>
              </Cell>
              <Cell span={4}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$part2.selectedText}
                  label=""
                />
              </Cell>
              <Cell span={2}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$part2.code}
                  label="Código"
                  disabled
                />
              </Cell>
              <Cell span={2}>
                <InputNumber
                  label="Tiempo (número)"
                  value={timePart2}
                  unit={timeUnitPart2}
                />
              </Cell>
              <Cell span={2}>
                <Select label="Tiempo" items={ageUnits} value={timeUnitPart2} />
              </Cell>
              <Cell span={2}>
                <Modal id={4} />
              </Cell>
              <Cell span={9}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$causeOfDeath}
                  label="Causa básica de defunción"
                />
              </Cell>
              <Cell span={3}>
                <Textfield
                  style="width: 100%;"
                  bind:value={$aditionalCode}
                  label="Código"
                />
              </Cell>
            </InnerGrid>
          </Content>
        </Card>
      </Cell>
    </InnerGrid>
  </Content>
</Card>
