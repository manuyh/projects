<script>
  export let label;
  export let items;
  export let value;
  export let disabled = false;

  import Select, { Option } from "@smui/select";
</script>

<Select
  bind:value={$value}
  {label}
  key={(item) => `${item?.label || ""}`}
  style="width: 100%;"
  {disabled}
>
  {#each items as item (item.label)}
    <Option value={item}>{`${item.identifier} -  ${item.label}`}</Option>
  {/each}
</Select>
