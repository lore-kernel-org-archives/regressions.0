Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D87C
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 13:17:47 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oWHPc-0007J4-NY; Thu, 08 Sep 2022 15:17:44 +0200
Message-ID: <00f37e8e-47d7-63bf-2349-7cbbc663111a@leemhuis.info>
Date: Thu, 8 Sep 2022 15:17:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
 #forregzbot
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 lkp@lists.01.org
References: <YvEgyQM/Wi0E2J3J@xsang-OptiPlex-9020>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YvEgyQM/Wi0E2J3J@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662643067;879271ab;
X-HE-SMSGID: 1oWHPc-0007J4-NY

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

As per recent general discussions with the 0-day folks, I'm dropping
below regression report from the list of tracked issues, as this report
didn't gain any traction. That for example can happen (often without any
reply!) if the developers considered the regression of no practical
relevance, as they assume it only materializes in micro-benchmarks, is
due to a broken test case, or some fluke.

Not sure if that or something else is the reason why this particular
report didn't gain any traction, but I lack the bandwidth to follow-up
on each and every regression 0-day bot found and reported. At the
same time I don't want to keep these reports in the list of tracked
issues forever, as that creates noise and makes it harder to spot the
important issues in regzbot's reports and lists. That's why I hereby
remove it:

#regzbot invalid: 0-day report that didn't get traction; likely of no
relevance, not sure

Ciao, Thorsten

On 08.08.22 16:42, kernel test robot wrote:
> 
> (pleased be noted we found the issue still exists on latest maineline,
> so report though the commit is old, FYI)
> 
> 
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-11):
> 
> commit: efcfec579f6139528c9e6925eca2bc4a36da65c6 ("loop: fix no-unmap write-zeroes request behavior")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> in testcase: mdadm-selftests
> version: mdadm-selftests-x86_64-5f41845-1_20220518
> with following parameters:
> 
> 	disk: 1HDD
> 	test_prefix: 12
> 	ucode: 0x28
> 
> 
> 
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790T CPU @ 2.70GHz with 16G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> 
> 2022-08-05 18:01:28 mkdir -p /var/tmp
> 2022-08-05 18:01:28 mke2fs -t ext3 -b 4096 -J size=4 -q /dev/sda1
> 2022-08-05 18:02:00 mount -t ext3 /dev/sda1 /var/tmp
> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
> -e 's,{MAP_PATH},/run/mdadm/map,g'  mdadm.8.in > mdadm.8
> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
> /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
> /usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rules.d/01-md-raid-creating.rules
> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/63-md-raid-arrays.rules
> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d/64-md-raid-assembly.rules
> /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /lib/udev/rules.d/69-md-clustered-confirm-device.rules
> /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
> /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
> Testing on linux-5.4.0-rc2-00010-gefcfec579f6139 kernel
> /lkp/benchmarks/mdadm-selftests/tests/12imsm-r0_2d-grow-r0_3d... 
> 	ERROR: dmesg prints errors when testing 12imsm-r0_2d-grow-r0_3d! 
> 
> FAILED - see /var/tmp/12imsm-r0_2d-grow-r0_3d.log and /var/tmp/fail12imsm-r0_2d-grow-r0_3d.log for details
> Testing on linux-5.4.0-rc2-00010-gefcfec579f6139 kernel
> /lkp/benchmarks/mdadm-selftests/tests/12imsm-r0_2d-grow-r0_4d... 
> 	ERROR: dmesg prints errors when testing 12imsm-r0_2d-grow-r0_4d! 
> 
> FAILED - see /var/tmp/12imsm-r0_2d-grow-r0_4d.log and /var/tmp/fail12imsm-r0_2d-grow-r0_4d.log for details
> Testing on linux-5.4.0-rc2-00010-gefcfec579f6139 kernel
> /lkp/benchmarks/mdadm-selftests/tests/12imsm-r0_2d-grow-r0_5d... 
> 	ERROR: dmesg prints errors when testing 12imsm-r0_2d-grow-r0_5d! 
> 
> FAILED - see /var/tmp/12imsm-r0_2d-grow-r0_5d.log and /var/tmp/fail12imsm-r0_2d-grow-r0_5d.log for details
> Testing on linux-5.4.0-rc2-00010-gefcfec579f6139 kernel
> /lkp/benchmarks/mdadm-selftests/tests/12imsm-r0_3d-grow-r0_4d... 
> 	ERROR: dmesg prints errors when testing 12imsm-r0_3d-grow-r0_4d! 
> 
> FAILED - see /var/tmp/12imsm-r0_3d-grow-r0_4d.log and /var/tmp/fail12imsm-r0_3d-grow-r0_4d.log for details
> Testing on linux-5.4.0-rc2-00010-gefcfec579f6139 kernel
> /lkp/benchmarks/mdadm-selftests/tests/12imsm-r5_3d-grow-r5_4d... succeeded
> Testing on linux-5.4.0-rc2-00010-gefcfec579f6139 kernel
> /lkp/benchmarks/mdadm-selftests/tests/12imsm-r5_3d-grow-r5_5d... succeeded
> 
> 
> 
> To reproduce:
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
>         sudo bin/lkp run generated-yaml-file
> 
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> 
> 
> #regzbot introduced: efcfec579f
> 
