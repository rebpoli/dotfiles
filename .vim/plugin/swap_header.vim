" Function to switch between source and header files
function! SwitchSourceHeader()
    " Get the current filename and extension
    let basename = expand("%:r")
    let ext = expand("%:e")
    
    " Determine the target file based on current extension
    if ext == "cpp" || ext == "c" || ext == "cc"
        " Try to find the header file in include/ or src/
        let header_path = "include/" . substitute(basename, "src/", "", "") . ".h"
        let alt_header_path = "src/" . substitute(basename, "include/", "", "") . ".h"
        
        if filereadable(header_path)
            execute "edit " . header_path
        elseif filereadable(alt_header_path)
            execute "edit " . alt_header_path
        else
            echo "No header file found"
        endif
    elseif ext == "h"
        " Try to find the source file in src/ or current directory
        let source_paths = [
            \ substitute(basename, "include/", "src/", "") . ".cpp",
            \ substitute(basename, "include/", "src/", "") . ".c",
            \ substitute(basename, "include/", "src/", "") . ".cc",
            \ basename . ".cpp",
            \ basename . ".c",
            \ basename . ".cc"
        \ ]
        
        for path in source_paths
            if filereadable(path)
                execute "edit " . path
                return
            endif
        endfor
        
        echo "No source file found"
    else
        echo "Not a source or header file"
    endif
endfunction

