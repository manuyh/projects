<script>
  export let id;
  export let disabled = false;

  import { onMount } from "svelte";
  import Button, { Label } from "@smui/button";
  import Dialog, { Header, Content, Title } from "@smui/dialog";
  import IconButton from "@smui/icon-button";

  import { a, b, c, d, part2 } from "./store";
  import config from "../../config";

  const states = Array.from({ length: 5 }, () => ({
    loading: false,
    showButton: false,
    showModal: false,
  }));

  const map = {
    0: a,
    1: b,
    2: c,
    3: d,
    4: part2,
  };

  const template = {
    IDLE: {
      loading: false,
      showButton: false,
      showModal: false,
    },
    OPEN_MODAL: {
      showButton: true,
      showModal: true,
    },
    LOAD_TOOL: {
      loading: true,
    },
    HIDE_BUTTON: {
      showButton: false,
    },
    SELECT_ILLNESS: {
      showModal: false,
    },
    CLOSE_MODAL: {
      loading: false,
      showButton: false,
      showModal: false,
    },
  };

  const selectedEntityFunction = (entity) => {
    map[id].set(entity);
    ECT.Handler.clear(id);
    states[id] = { ...states[id], ...template.SELECT_ILLNESS };
    states[id] = { ...states[id], ...template.IDLE };
  };

  onMount(() => {
    ECT.Handler.configure(config.settings());
  });

  function bindECT() {
    states[id] = { ...states[id], ...template.LOAD_TOOL };
    ECT.Handler.bind(id);
    ECT.Handler.selectedEntityFunction = selectedEntityFunction;

    setTimeout(() => {
      states[id] = { ...states[id], ...template.HIDE_BUTTON };
    }, 500);
  }
</script>

<Button
  on:click={() => {
    states[id] = { ...states[id], ...template.OPEN_MODAL };
  }}
  {disabled}
>
  <Label>Herramienta CIE-11</Label>
</Button>
<Dialog
  bind:open={states[id].showModal}
  fullscreen
  scrimClickAction=""
  escapeKeyAction=""
>
  <Header>
    <Title>Seleccionar Padecimientos</Title>
    <IconButton
      class="material-icons"
      on:click={() => {
        states[id] = { ...states[id], ...template.CLOSE_MODAL };
      }}
    >
      close
    </IconButton>
  </Header>
  <Content>
    <input
      type="text"
      class="ctw-input"
      autocomplete="off"
      data-ctw-ino={id}
      disabled={!states[id].loading && states[id].showButton}
    />
    {#if states[id].showButton}
      <Button on:click={bindECT}>
        <Label>
          {#if states[id].loading}
            Cargando...
          {:else}
            Cargar herramienta
          {/if}
        </Label>
      </Button>
    {/if}
    <div class="ctw-window" data-ctw-ino={id} />
  </Content>
</Dialog>
