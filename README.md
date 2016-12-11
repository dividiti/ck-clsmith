CK repository: Converting CLsmith tool (PLDI'15 artifact) to CK format
======================================================================

Status
======
This is a relatively stable repository demonstrating how to share
artifacts (tools and datasets) via CK. We converted CLsmith tool
for fuzz testing of OpenCL compilers into the CK format.

Prerequisites
=============
* Collective Knowledge Framework: http://github.com/ctuning/ck

Description
===========
CLsmith is a tool designed to address the compiler correctness problem 
for many-core systems through novel applications of fuzz testing to 
OpenCL compilers. It was shared as artifact along with the following
PLDI'15 paper:
 
http://multicore.doc.ic.ac.uk/publications/clsmith-pldi-15.html 

"Many-Core Compiler Fuzzing"
Christopher Lidbury, Andrei Lascu, Nathan Chong, Alastair F. Donaldson

We converted this artifact to CK format (finer-grain and reusable components),
shared it as standard CK repository on GitHub
and validated it via experiment crowdsourcing on several machines.

CLsmith converted to CK can also serve as a template to describe 
and share other artifacts in CK format along with publications:
* AE PPoPP 2016: http://cTuning.org/event/ae-ppopp2016
* AE CGO 2016: http://cTuning.org/event/ae-cgo2016
* ADAPT 2016: http://adapt-workshop.org

Quick installation
============

```
$ sudo pip install ck
$ ck pull repo:ck-clsmith
```

Usage
=====
We provided usage scenario in the CK documentation [here](https://github.com/ctuning/ck/wiki/Autotuning-example-clsmith).

Crowd-results
=============
You can see live results [here](http://cknowledge.org/repo/web.php?subview=a9143fb9593da7f9&wcid=bc0409fb61f0aa82:0d9e443249d38187&table_sort=2)

Publications
============

* http://multicore.doc.ic.ac.uk/publications/clsmith-pldi-15.html
* https://arxiv.org/abs/1506.06256

Testimonials and awards
=======================
* 2016: HiPEAC technology transfer award for CK-powered CLsmith: [HiPEAC TT winners](https://www.hipeac.net/research/technology-transfer-awards/2016)

