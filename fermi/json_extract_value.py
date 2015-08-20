import sys
import json
import fileinput

'''
This scripts parses json from std in
and output a value json[key] = value
the key is passed as argument
if no key is passed, it outputs the json formatted

$ echo '{"Directory": "/lustre/snsfs/scratch/apache/rhf_511","TransID": 511}' | python json_extract_value.py
{
    "Directory": "/lustre/snsfs/scratch/apache/rhf_511",
    "TransID": 511
}

$ echo '{"Directory": "/lustre/snsfs/scratch/apache/rhf_511","TransID": 511}' | python json_extract_value.py Directory
/lustre/snsfs/scratch/apache/rhf_511

'''

def main(argv):
    if len(argv) > 2:
        sys.stderr.write('ERROR: Usage: %s [json key]\n'% argv[0])
        return 1

    try:
        j = json.load(sys.stdin)
    except Exception, err:
        sys.stderr.write('ERROR: %s\n' % str(err))
        return 1

    if len(argv) == 2:
        print j[argv[1]]
        return 0

    if len(argv) <= 1:
        print(json.dumps(j, sort_keys=True, indent=4))
        return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv))
