<script>
  export let label;
  export let value;
  export let unit;
  export let disabled = false;

  import Tooltip, { Wrapper } from "@smui/tooltip";
  import Textfield from "@smui/textfield";

  let helperText;

  $: {
    switch ($unit?.identifier) {
      case 9:
        value.set(999);
        helperText = undefined;
        break;
      case 5:
        helperText = "Rango entre 1 y 120";
        break;
      case 4:
        helperText = "Rango entre 1 y 11";
        break;
      case 3:
        helperText = "Rango entre 1 y 29";
        break;
      case 2:
        helperText = "Rango entre 1 y 23";
        break;
      case 1:
        helperText = "Rango entre 1 y 59";
        break;
    }
  }

  $: {
    if ($value <= 0 && $value !== null) {
      value.set(0);
    }

    if ($unit?.id === 5 && $value >= 120) {
      value.set(120);
    } else if ($unit?.id === 4 && $value >= 11) {
      value.set(11);
    } else if ($unit?.id === 3 && $value >= 29) {
      value.set(29);
    } else if ($unit?.id === 2 && $value >= 23) {
      value.set(23);
    } else if ($unit?.id === 1 && $value >= 59) {
      value.set(59);
    } else if ($unit?.id === 9 && $value !== 999) {
      value.set(999);
    }
  }
</script>

<Wrapper>
  <Textfield
    bind:value={$value}
    {label}
    type="number"
    {disabled}
    style="width: 100%;"
  />
  {#if helperText !== undefined}
    <Tooltip>{helperText}</Tooltip>
  {/if}
</Wrapper>
