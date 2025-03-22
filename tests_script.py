import subprocess
import typer
import os
from typing_extensions import Annotated

def main(program_path: Annotated[str, typer.Argument()], tests_path:  Annotated[str, typer.Argument()]):
    files = [f for f in os.listdir(tests_path) if os.path.isfile(os.path.join(tests_path, f))]
    in_files = [f for f in files if '.in' in f]
    out_files = [f for f in files if '.out' in f]
    
    test_score = {}
    
    for file in in_files:
        if file not in test_score:
            test_score[file] = 'not tested'
            
        input_data = ''
        output_data = ''
        with open(os.path.join(tests_path, file), 'r') as f:
            input_data = f.read()
            
        with open(os.path.join(tests_path, file.replace('.in', '.out'))) as f:
            output_data = f.read()
        
        input_data = bytes(input_data, 'utf8')        
        output_data = bytes(output_data, 'utf8')
    
        print(f"Running for test {file}...")
        process=subprocess.Popen(['runhaskell', f'{program_path}'],
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        stdoutdata, stderrdata=process.communicate(input=input_data)
        
        if output_data == stdoutdata:
            test_score[file] = 'passed'
        else:
            test_score[file] = 'failed'
    
    print("\nScore:")
    for test in test_score.keys():
        print(f"{test}:\t{test_score[test]}")
    
if __name__ == '__main__':
    typer.run(main)