cd..
cd ..
cd ..
cd ..
ls
cd d
ls
cd ..
cd ..
cd ..
cd d
git clone http://prd-gitlab01.tce.govrn/bi/ordemcronologica.git
git clone git@prd-gitlab01.tce.govrn:bi/ordemcronologica.git
git clone http://prd-gitlab01.tce.govrn/bi/ordemcronologica.git
cd ..
cd ..
cd ..
cd D
cd git
cd git
git clone https://github.com/gabrielfas/diario-rn-webscraper.git
cd git
cd diario-rn-webscraper/
git status
cd ..
cd ..
cd ..
cd d
cd ordemcronologica/
git branch
git branch -l
git branch -help
git branch --list
git checkout dev
git -help
git branch -a
git checkout docs
git checkout docs
git status
git add .
git commit -m "Adicionando documentação e transfomações"
ssh 10.24.0.46
ssh 10.24.0.46/52
ssh 10.24.0.46 -p 22
ssh 06827531490@10.24.0.46 -p 22
ssh sugreenplum@10.24.0.46 -p 22
ssh sugreenplum@10.24.0.46 
ssh sugreenplum@10.24.0.46 
ssh sugreenplum@10.24.0.46 
ssh gpadmin@10.24.0.46
ssh gpadmin@10.24.0.46
#!/bin/sh
# *****************************************************************************
#
# Pentaho Data Integration
#
# Copyright (C) 2005 - 2019 by Hitachi Vantara : http://www.hitachivantara.com
#
# *****************************************************************************
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# *****************************************************************************
# **************************************************
# ** Set these to the location of your mozilla
# ** installation directory.  Use a Mozilla with
# ** Gtk2 and Fte enabled.
# **************************************************
# set MOZILLA_FIVE_HOME=/usr/local/mozilla
# set LD_LIBRARY_PATH=/usr/local/mozilla
# Try to guess xulrunner location - change this if you need to
MOZILLA_FIVE_HOME=$(find /usr/lib -maxdepth 1 -name xulrunner-[0-9]* | head -1)
LD_LIBRARY_PATH=${MOZILLA_FIVE_HOME}:${LD_LIBRARY_PATH}
export MOZILLA_FIVE_HOME LD_LIBRARY_PATH
# Fix for GTK Windows issues with SWT
export GDK_NATIVE_WINDOWS=1
# Fix GTK 3 issues with SWT
export SWT_GTK3=0
# Fix overlay scrollbar bug with Ubuntu 11.04
export LIBOVERLAY_SCROLLBAR=0
# Fix menus not showing up on Ubuntu 14.04's unity
# Bug in: https://bugs.launchpad.net/ubuntu/+source/unity-gtk-module/+bug/1208019
export UBUNTU_MENUPROXY=0
# Supposed spoon.sh and set-env.sh files both are located in data-integration folder  
# **************************************************
# ** Set INITIALDIR, BASEDIR AND CURRENTDIR       **
# **************************************************
INITIALDIR=`pwd`
# set absolute path to data-integration folder
BASEDIR=$( cd "$( dirname "$0" )" && pwd )
CURRENTDIR="."
. "$BASEDIR/set-pentaho-env.sh"
setPentahoEnv
# **************************************************
# ** Platform specific libraries ...              **
# **************************************************
LIBPATH="NONE"
STARTUP="$BASEDIR/launcher/launcher.jar"
if [ -z "$IS_YARN" ]; then 	cd $BASEDIR; else 	cd "$BASEDIR"; fi
case `uname -s` in  	AIX) 	ARCH=`uname -m`; 		case $ARCH in 			ppc) 				LIBPATH=$CURRENTDIR/../libswt/aix/; 				;; 			ppc64) 				LIBPATH=$CURRENTDIR/../libswt/aix64/; 				;; 			*)	 				echo "I'm sorry, this AIX platform [$ARCH] is not yet supported!"; 				exit; 				;; 		esac; 		;; 	SunOS) ; 	ARCH=`uname -m`; 		case $ARCH in 			i[3-6]86) 				LIBPATH=$CURRENTDIR/../libswt/solaris-x86/; 				;; 			*)	 				LIBPATH=$CURRENTDIR/../libswt/solaris/; 				;; 		esac; 		;; 	Darwin);     ARCH=`uname -m`; 	if [ -z "$IS_KITCHEN" ]; then 		OPT="-XstartOnFirstThread $OPT"; 	fi; 	case $ARCH in 		x86_64) 			if $($_PENTAHO_JAVA -version 2>&1 | grep "64-Bit" > /dev/null );                             then 			  LIBPATH=$CURRENTDIR/../libswt/osx64/;                             else 			  LIBPATH=$CURRENTDIR/../libswt/osx/;                             fi; 			;; 		i[3-6]86) 			LIBPATH=$CURRENTDIR/../libswt/osx/; 			;; 		*)	 			echo "I'm sorry, this Mac platform [$ARCH] is not yet supported!"; 			echo "Please try starting using 'Data Integration 32-bit' or"; 			echo "'Data Integration 64-bit' as appropriate."; 			exit; 			;; 	esac; 	;; 	Linux);              if [ -f /sbin/ldconfig ]; then               LDCONFIG=/sbin/ldconfig;             else               LDCONFIG=ldconfig;             fi;             HASWEBKITGTK=`$LDCONFIG -p | grep webkitgtk-1.0`;             export LIBWEBKITGTK="$HASWEBKITGTK";             export JavaScriptCoreUseJIT=0;             if [ -z "$HASWEBKITGTK" ] && [ "1" != "$SKIP_WEBKITGTK_CHECK" ]; then               echo "#######################################################################";               echo "WARNING:  no libwebkitgtk-1.0 detected, some features will be unavailable";               echo "    Consider installing the package with apt-get or yum.";               echo "    e.g. 'sudo apt-get install libwebkitgtk-1.0-0'";               echo "#######################################################################";             fi;  	    ARCH=`uname -m`; 		case $ARCH in 			x86_64) 				if $($_PENTAHO_JAVA -version 2>&1 | grep "64-Bit" > /dev/null );                                 then 				  LIBPATH=$CURRENTDIR/../libswt/linux/x86_64/;                                 else 				  LIBPATH=$CURRENTDIR/../libswt/linux/x86/;                                 fi; 				;; 			i[3-6]86) 				LIBPATH=$CURRENTDIR/../libswt/linux/x86/; 				;; 			ppc) 				LIBPATH=$CURRENTDIR/../libswt/linux/ppc/; 				;; 			ppc64) 				LIBPATH=$CURRENTDIR/../libswt/linux/ppc64/; 				;; 			*)	 				echo "I'm sorry, this Linux platform [$ARCH] is not yet supported!"; 				exit; 				;; 		esac; 		;; 	FreeBSD) 	    ARCH=`uname -m`; 		case $ARCH in 			x86_64) 				LIBPATH=$CURRENTDIR/../libswt/linux/x86_64/; 				echo "I'm sorry, this FreeBSD platform [$ARCH] is not yet supported!"; 				exit; 				;; 			i[3-6]86) 				LIBPATH=$CURRENTDIR/../libswt/linux/x86/; 				;; 			ppc) 				LIBPATH=$CURRENTDIR/../libswt/linux/ppc/; 				echo "I'm sorry, this FreeBSD platform [$ARCH] is not yet supported!"; 				exit; 				;; 			*)	 				echo "I'm sorry, this FreeBSD platform [$ARCH] is not yet supported!"; 				exit; 				;; 		esac; 		;; 	HP-UX) ; 		LIBPATH=$CURRENTDIR/../libswt/hpux/; 		;; 	CYGWIN*); 		./Spoon.bat; 		exit; 		;; 	*) ; 		echo Spoon is not supported on this hosttype : `uname -s`; 		exit; 		;; esac 
cd ;;
cd ..
cd ..
cd ..
cd d/ordemcronologica/
git status
git add .
git commit -m "atualizando transformações e documentação"
git config --global user.email "gabriel"
git config --global user.name "gabriel"
git commit -m "atualizando transformações e documentação"
git push
git status
git add .
git commit -m "adicionando dashboard"
git push
cd ../../..
cd d
cd ordemcronologica/
git status
git add .
git add .
git status
git commit -m "corrigindo erros e adicionando pequenas features"
git push
git push
cd ..
cd ..
cd ..
cd d
git clone https://github.com/gabrielfas/datacamp-projects.git
cd datacamp-projects/
git add .
git commit -m "adding new project"
git push
git config --global user.name "gabrielfas"
git push
git add .
git push
git commit -m "adding new project"
git push
git config --global user.email "g.felipes@hotmail.com"
git add .
git commit -m "adding new project"
git push
cd ../../..
cd d
cd datacamp-projects/
git add .
git commit -m "adding new project"
git push
ls
cd git
git clone https://github.com/gabrielfas/songs-clustering-recommendations.git
cd git
cd songs-clustering-recommendations/
git status
git add .
git commit -m "Changing the number of clusters"
git pull
git push
git status
git add .
git commit -m "Changing the number of clusters"
git push
ssh 10.24.0.112

scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel Pessoal/etl_dp_outros_estados/ D:\TRAMPO TCE\Projeto DP
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel Pessoal/etl_dp_outros_estados/ D:\TRAMPO TCE\Projeto DP
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel Pessoal/etl_dp_outros_estados/ C:
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel Pessoal/etl_dp_outros_estados/ C:
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel Pessoal/etl_dp_outros_estados/ /Projeto DP/
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel Pessoal/etl_dp_outros_estados/ 
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/'Painel Pessoal'/etl_dp_outros_estados/ 
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/'Painel Pessoal'/etl_dp_outros_estados/  /DP/
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel\ Pessoal/etl_dp_outros_estados/
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/Painel\ Pessoal/etl_dp_outros_estados/ /DP/
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/
scp -r pdi@10.24.0.112:/Projetos/DespesaPessoal/ArquivosOutrosEstados/ /D:/
git clone https://github.com/gabrielfas/diversify.git
git branch dados
git checkout -b dados1
cd diversify/
git checkout -b dados1
git status
git add .
git commit -m "adicionando arquivo"
git push
git push origin dados1
git checkout -b dados2
git status
git add .
git commit -m "adicionando arquivo"
git push origin dados2
cd diversify/
git checkout master
git checkout -b dados3
git status
git add .
git commit -m "adicionando arquivo"
git push origin dados3
git checkout master
git checkout dados1
git pull
git status
git commit -m "adicionando arquivos"
git add .
git commit -m "adicionando arquivos"
git push origin dados1
git checkout master
git clone https://github.com/gabrielfas/deteccao-de-mascara.git
