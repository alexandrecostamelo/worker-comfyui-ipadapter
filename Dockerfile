FROM runpod/worker-comfyui:5.8.5-base

# Instalar IPAdapter custom node
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

# Baixar SDXL
RUN wget -q -O /comfyui/models/checkpoints/sd_xl_base_1.0.safetensors \
    "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"

# Baixar IPAdapter SDXL
RUN mkdir -p /comfyui/models/ipadapter && \
    wget -q -O /comfyui/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors \
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors"

# Baixar CLIP Vision
RUN mkdir -p /comfyui/models/clip_vision && \
    wget -q -O /comfyui/models/clip_vision/clip_vision_g.safetensors \
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors"
