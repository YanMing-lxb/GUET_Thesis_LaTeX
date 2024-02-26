.DEFAULT_GOAL := all

.PHONY: h v c C nq p x l

all:
	python3 ./pytexmk.py $(ptm)

h v c C nq p x l:
	python3 ./pytexmk.py -$@  $(filter-out $@,$(MAKECMDGOALS))

# 示例：make ptm='-x -nq main' 可传入多个参数