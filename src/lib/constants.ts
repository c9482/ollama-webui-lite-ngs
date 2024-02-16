import { env } from '$env/dynamic/public'

export const OLLAMA_API_BASE_URL = env.PUBLIC_OLLAMA_API_BASE_URL ?? `http://localhost:11434/api`;
export const WEB_UI_VERSION = "v0.0.3-lite";

