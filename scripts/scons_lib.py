import os.path as osp

env = None
def set_env(e):
    global env
    env = e
    return env

def filename(f):
    return osp.splitext(osp.basename(f))[0]

def compile(obj, src=None, tmp=None):
    n = filename(obj)
    if not src:
        src = f'src/{n}.s'

    if src.endswith('.s'):
        if not tmp:
            tmp = f'out/{n}.s'

        env.Command(tmp, src, 'riscv-none-elf-cpp -I ./src -E ${SOURCE} >${TARGET}')
        env.Command(obj, tmp, 'riscv-none-elf-gcc -g -c ${SOURCE} -march=rv32i -o ${TARGET}')
    else:
        env.Command(obj, src, 'riscv-none-elf-gcc -g -I ./src -c ${SOURCE} -march=rv32i -o ${TARGET}')

def bin2hex(bin_f, hex_f=None):
    if not hex_f:
        hex_f = osp.splitext(bin_f)[0]+'.hex'
    env.Command(hex_f, bin_f, "od -t x4 ${SOURCE} -A n -v |  sed -e '1s/^/v3.0 hex words plain\\n/' > ${TARGET}")