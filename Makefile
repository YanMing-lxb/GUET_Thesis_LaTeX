all:
	python3 ./pytexmk.py

%:
	python3 ./pytexmk.py $(subst _,$@,-$@)
%:
	python3 ./pytexmk.py $*

