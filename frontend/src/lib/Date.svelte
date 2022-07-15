<script>
  export let value;
  export let label;
  export let disabled = false;

  import Textfield from "@smui/textfield";
</script>

<Textfield
  bind:value={$value}
  {label}
  {disabled}
  type="date"
  style="width: 100%;"
/>
