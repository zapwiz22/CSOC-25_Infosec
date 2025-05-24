def transpile_line(line):
    line = line.strip()

    # for maanlo that is variable declaration
    if line.startswith("maanlo "):
        parts = line[7:].split("=",1)
        if (len(parts)==2):
            var, value = parts[0].strip(), parts[1].strip()
            return f"{var} = {value}"
        else:
            return "# Error: Invalid 'maanlo' syntax"
    
    # for dikhao that is print statement 
    elif line.startswith("dikhao("):
        expr = line[7:-1].strip()
        return f"print({expr})"

    # for conditional statement that is agar -> if , nahi to -> elif , warna -> else
    elif line.startswith("agar("):
        cond_end = line.find(")")
        if cond_end!=-1 and "{" in line:
            cond = line[5:cond_end].strip()
            return f"if {cond}:"
    elif line.startswith("nahi to("):
        cond_end = line.find(")")
        if cond_end!=-1 and "{" in line:
            cond = line[8:cond_end].strip()
            return f"elif {cond}:"
    elif line.startswith("warna"):
        return f"else:"
    
    # for loops (only for while loop)
    elif line.startswith("jab tak("):
        cond_end = line.find(")")
        if cond_end!=-1 and "{" in line:
            cond = line[8:cond_end].strip()
            return f"while {cond}:"
    
    # comments // -> # in python
    elif line.startswith("//"):
        return "#" + line[2:]
    
    elif line.startswith("}"):
        return ""
    
    return line

def transpile_file(file):
    output = []
    indent = 0
    with open(file,"r") as f:
        for line in f:
            stripped = line.strip()
            if stripped == "}":
                indent -= 1
                continue

            pyline = transpile_line(line)

            if pyline.endswith(":"):
                output.append("    "*indent + pyline)
                indent += 1
            elif pyline:
                output.append("    "*indent + pyline)
    
    return "\n".join(output)

import sys 

def main():
    if (len(sys.argv)) != 2:
        print("Usage: python3 transpiler.py <filename.jk>")
        return 
    
    jk_file = sys.argv[1]

    if not jk_file.endswith(".jk"):
        print("Error: file must end with jk")
        return 

    try:
        python_code = transpile_file(jk_file)
        py_file = jk_file.replace(".jk",".py")

        with open(py_file,"w") as f:
            f.write(python_code)
        
        print("Transpiled successfully!")
        print(f"Run using python3 {py_file}")
    except FileNotFoundError:
        print("Error: file not found")
    except Exception as e:
        print("Error: ",e)


main()