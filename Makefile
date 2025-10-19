all: tidy

zip:
	bash zip_sources.sh arch ioc c h cproject project mxproject gitmodules gitignore sh Makefile cpp cc ld py md txt tex
	
clean:
	rm arch.zip
	
format: 
	find . -iregex '.*\.\(c\|h|cpp|py\)'| xargs clang-format -i

print-%  : ; @echo $* = $($*)

SOURCES := $(shell find . -type f -iregex '.*\.\(c\|cpp\)')
INC := $(shell find . -type d \( -iname 'inc' -o -iname 'inc*' \))
INCLUDES := $(addprefix -I,$(INC))

DEFS := -DUSE_HAL_DRIVER -DSTM32L476xx -D__GNUC__ -D__ARM_ARCH_7EM__

CSTD := -std=c11
TARGET := -target arm-none-eabi

tidy:
	@for src in $(SOURCES); do \
		echo "Running clang-tidy on $$src..."; \
		clang-tidy $$src -- $(CSTD) $(TARGET) $(DEFS) $(INCLUDES) ; \
	done
	@echo "Done"

print-INCLUDES:
	@echo $(INCLUDES)
