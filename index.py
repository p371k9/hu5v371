import sys, argparse
with open('index.html') as f:
    i = f.read()

from markdown import markdown
with open('README.md') as f:
    r = f.read()
rh = markdown(r)

from jinja2 import Template
template = Template(i)
html = template.render(tart=rh)

parser = argparse.ArgumentParser(
    description='index.html legenerálása', 
    epilog='programozottan.'
)
parser.add_argument(
    'outfile', 
    nargs='?', 
    type=argparse.FileType('w'), 
    default=sys.stdout, 
    help='If not specified, the output will be sent to STDOUT.'
)
args = parser.parse_args()
if args.outfile.name == '<stdout>':
    
    sys.stdout.write(html)
    exit()

print("Writing to " + args.outfile.name +".")    
with open(args.outfile.name, 'w') as f:
    f.write(html)


#import os
#print(os.path.dirname(os.path.realpath(__file__)))

