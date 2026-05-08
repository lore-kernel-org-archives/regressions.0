Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF7308F26
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271709; cv=none; b=Qp9oG3u6iDWC0exBUpb/90E3/BJvGydPIRWxETZkCCs6A2iF1j+RJ5Qq3smsJbBeC0H3snzwSHmMdYm1WeGyfa68Cs10QcClDa2dV6pIQB8GBN5bMHJn2fsV74+oaZd9lOa8+P23q4sxNcH0gOPpbeju9BtR2ySxVPVRVKhcUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271709; c=relaxed/simple;
	bh=rfJNHGDEEb9AWgAh1BjDeTFID1Cj9yK6Q7bo9Z182A0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mm8Pgi5wumxMsd2KHfeGWnvLSB15s9HHZAfNbOIEmoyvS5Ju5HxMJMikomKQ0Kcr3Y4S9YMrbxfXHPeTmx44MsG6baGYq7tfvqyF4a4kFtKu8CrsE3e6v8UOIg+0mt8TPcFDc4aSw3ibHCvRdlwtsHjwCBWEBJhUIRACO87/tsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1rp+V/V; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1rp+V/V"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1329fc4bf77so339491c88.1
        for <regressions@lists.linux.dev>; Fri, 08 May 2026 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778271707; x=1778876507; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ixs/RBeSRw/1zBXWhTXPnd24zouTe6elpYl19qS6tk=;
        b=M1rp+V/VrorS57HE+tDs6IGC+g0pFeWixlIwbF6Puf2JY3tI3k8xMhfBmJbo+Hy/1l
         myosArImZoWe2M8ea6nEFmJmyhyMKfFvHI6Ko3WExHFOSIvisNk6IyttbCNOLbeV+XRJ
         ReiFA1KM+kywJ7BUc8H34xiGLnembmUYbnkWqhQt4WDTzEVcCgWEJD/ya/izPADe9zFg
         6egHjQyB11olCJ5l3myU4xcyE04dcsxitryrETRSItFdZ7Rvt7gw2sGgmqJFVUFN6KEO
         EVsLPG3Xpv0b/VT2STAv93MpUsR583WY+pJNm1SQIW17arbNobRxJ3e1wCwUekRUoLiW
         ceHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271707; x=1778876507;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ixs/RBeSRw/1zBXWhTXPnd24zouTe6elpYl19qS6tk=;
        b=JIBHjHQzm4x8CkTmevakfO4UkFEz81E1gcV0VvtJWs7Ggzqj5yByHogoL2OibXZreP
         mAVzRs+IziHGfOMTUY9aoQEZkOUu0JKpG0+fKHeDXc7fMb950+qHXZP3PnO8OEROFfcC
         kjH+Iybfv0wItW5ophD24NWFw7wtBRL8G5ek3e+k8/Tn17s9bEaC/eSApYmdKcjFUmhG
         LQRESeQlFSITCjpYfXqUqQzZ7IO9L1GmahezwNcCjIN6N6ljqA8ZCctb7zoU027FS4Ow
         s5Y7wzwApZp9ZOFSZobLtCuMGFv6mypiobrnfX89+iZ4fTfNuVUwKjYZvXQBy+tkwVt1
         9s6w==
X-Forwarded-Encrypted: i=1; AFNElJ/pS5w6bS+8NH0vW56WG9vnrnveivPGlPbAMTX4PJ713g+MmgzWqAbInC/r97BrH4S23KhnQwPeRl1VKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIx+bMh2kxSBW0oXT7FFRvfXBNzYpuH1iI8ycsjN9TqPwdZSq7
	Op2r3zFCgQ+LGIxTX4E6ovbsXSuJNaN/ciDKmnLKNeVPycULI4uPNexV5PIoBiL+
X-Gm-Gg: AeBDieueXME4OI22mgTJGjzNEPsGXomx8WPvT7JDRcCCbAAkxps2ARQDKr0P+rRmg9G
	Q0/YaIO8gye/aDmJZOyYWQUYlazJGO7BYEXrevxarlewUdqp2jDShj+jOpWWVaFq+vbjx5zcG6o
	+GgotUqt1nZe7C9dhQQoX+WFkwhzuA9LIwLxzHqwlTAqcGfJJTIP4dFxpm1IdhVRxf1ACaGNGeH
	uK747ux4zDLw79Zm5SwLloZDlLWxJ2ZR4rxw3vWCHaBDjqTmGLRlbC6WjIzPwmFTv6gz5fWqwU9
	dyAQSSQiPF/f3k3YMKdmPhjwU6sIaMsFr8vU3FmS5F/X37W1hzDzgBkA0iYQJBE49I6lYzpRhOg
	092Xay4OkYADETmNa4mbMsHVwjjtInd/DRSYs7giXfWaDwU+t0xBqFItB4L1yqFHoqF/PoKmSMP
	k/a5gB9IQr+s7S2HUi2jTgs2dydz4rJsjET8fNtfJM
X-Received: by 2002:a05:7022:1e10:b0:12b:fc21:874d with SMTP id a92af1059eb24-131880edbfemr7529522c88.19.1778271706356;
        Fri, 08 May 2026 13:21:46 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm3767958eec.25.2026.05.08.13.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 13:21:45 -0700 (PDT)
Message-ID: <f275d82e-2187-428f-a331-4001d9f9d853@gmail.com>
Date: Fri, 8 May 2026 13:21:44 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: the stuttering regression in 7.0: should I have done something
 different?
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
 <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
 <1c165caf-36b4-4673-97fd-ed86bef17b88@leemhuis.info>
 <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com>
In-Reply-To: <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Just confirmed on my end today.  This regression also impacts both 
SPARC64 S7-2 and SPARC64 T7-1 on v7.0.4 and v7.1-rc2 as well. Different 
systems using the same exact kernels.

** Please see points (A1) (A2) (B1) (B2)

Once again, I am not experiencing such issues when "my patch" (link 
below) is added to address this regression.

https://github.com/sparclinux/issues/issues/79#issuecomment-4362173884

Output demonstrating issues for SPARC64 S7-2 and T7-1 systems (without 
my regression patch):

PS - On May 2nd, 2026 at 9:42 PM: I also sent an email to Thomas 
Gleixner regarding this issue.  I will be happy to validate any patches 
from your end regarding this issue, as time permits me to do so.


Best regards,

Tony Rodriguez


  A1) SPARC64 S7-2: Kernel v7.1.0-rc2
uname -a
Linux s7t7-debian-test 7.1.0-rc2-test01 #1 SMP Fri May  8 10:02:12 PDT 
2026 sparc64 GNU/Linux

cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-7.1.0-rc2-test01 
root=UUID=ce937a4b-126a-41bd-a54b-03a424421086 ro console=ttyHV0,9600n81 
systemd.log_level=info systemd.show_status=1 
systemd.journald.forward_to_console=0 plymouth.enable=0 quiet

[  243.267359] INFO: task kworker/u512:1:706 blocked for more than 120 
seconds.
[  243.281208]       Not tainted 7.1.0-rc2-test01 #1
[  243.290583] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  243.306349] INFO: task kworker/127:1:714 blocked for more than 120 
seconds.
[  243.320106]       Not tainted 7.1.0-rc2-test01 #1
[  243.329476] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.

[  364.099350] INFO: task kworker/u512:1:706 blocked for more than 241 
seconds.
[  364.113199]       Not tainted 7.1.0-rc2-test01 #1
[  364.122585] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  364.138328] INFO: task kworker/127:1:714 blocked for more than 241 
seconds.
[  364.152086]       Not tainted 7.1.0-rc2-test01 #1
[  364.161470] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.

[  485.295360] INFO: task kworker/u512:1:706 blocked for more than 362 
seconds.
[  485.309209]       Not tainted 7.1.0-rc2-test01 #1
[  485.318581] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  485.334345] INFO: task kworker/127:1:714 blocked for more than 362 
seconds.
[  485.348099]       Not tainted 7.1.0-rc2-test01 #1
[  485.357467] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.

[  726.849598] INFO: task kworker/u512:1:706 blocked for more than 604 
seconds.
[  726.863444]       Not tainted 7.1.0-rc2-test01 #1
[  726.872832] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  726.888573] INFO: task kworker/127:1:714 blocked for more than 604 
seconds.
[  726.902340]       Not tainted 7.1.0-rc2-test01 #1
[  726.911708] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.

sudo dmesg | grep -iE block | grep -iE worker
[  243.267359] INFO: task kworker/u512:1:706 blocked for more than 120 
seconds.
[  243.306349] INFO: task kworker/127:1:714 blocked for more than 120 
seconds.
[  364.099350] INFO: task kworker/u512:1:706 blocked for more than 241 
seconds.
[  364.138328] INFO: task kworker/127:1:714 blocked for more than 241 
seconds.
[  485.295360] INFO: task kworker/u512:1:706 blocked for more than 362 
seconds.
[  485.334345] INFO: task kworker/127:1:714 blocked for more than 362 
seconds.
[  605.849474] INFO: task kworker/u512:1:706 blocked for more than 483 
seconds.
[  605.888461] INFO: task kworker/127:1:714 blocked for more than 483 
seconds.

sudo poweroff or sudo reboot
NOTE(S): Random hangs during startup. Also, hangs during shutdown/reboot 
process.
-------------------------------------------------------------------------------------------
A2) SPARC64 S7-2: Kernel v7.0.4
[  OK  ] Finished e2scrub_reap.service - Remove Stale Online ext4 
Metadata Check Snapshots.

Debian GNU/Linux forky/sid s7t7-debian-test ttyHV0

s7t7-debian-test login: tonyr
Password:
Linux s7t7-debian-test 7.0.4-test01 #1 SMP Fri May  8 09:27:58 PDT 2026 
sparc64
[...]
Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.

login: timed [  114.687722] rcu: INFO: rcu_sched detected stalls on 
CPUs/tasks:
[  114.699319] rcu:     67-...!: (240 GPs behind) idle=e9c0/0/0x0 
softirq=174/174 fqs=0 (false positive?)
[  114.717370] rcu:     102-...!: (73 GPs behind) idle=77e0/0/0x0 
softirq=286/287 fqs=0 (false positive?)
[  114.735419] rcu:     111-...!: (52 GPs behind) idle=11d8/0/0x0 
softirq=860/861 fqs=0 (false positive?)
[  114.753489] rcu:     (detected by 11, t=5268 jiffies, g=4457, q=528 
ncpus=128)
[  114.767628] rcu: rcu_sched kthread timer wakeup didn't happen for 
5270 jiffies! g4457 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  114.789647] rcu:     Possible timer handling issue on cpu=105 
timer-softirq=98
[  114.803535] rcu: rcu_sched kthread starved for 5280 jiffies! g4457 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=105
[  114.824201] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  114.842080] rcu: RCU grace-period kthread stack dump:
[  114.852221] rcu: Stack dump where RCU GP kthread last ran:
[  135.867723] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  135.879326] rcu:     65-...!: (1 GPs behind) idle=35b0/0/0x0 
softirq=483/484 fqs=0 (false positive?)
[  135.897024] rcu:     67-...!: (241 GPs behind) idle=ecc0/0/0x0 
softirq=174/174 fqs=0 (false positive?)
[  135.915082] rcu:     102-...!: (74 GPs behind) idle=7800/0/0x0 
softirq=286/287 fqs=0 (false positive?)
[  135.933123] rcu:     111-...!: (53 GPs behind) idle=1238/0/0x0 
softirq=860/861 fqs=0 (false positive?)
[  135.951184] rcu:     (detected by 64, t=5272 jiffies, g=4461, q=752 
ncpus=128)
[  135.965398] rcu: rcu_sched kthread timer wakeup didn't happen for 
5275 jiffies! g4461 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  135.987393] rcu:     Possible timer handling issue on cpu=105 
timer-softirq=98
[  136.001287] rcu: rcu_sched kthread starved for 5285 jiffies! g4461 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=105
[  136.021944] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  136.039829] rcu: RCU grace-period kthread stack dump:
[  136.049971] rcu: Stack dump where RCU GP kthread last ran:

NOTE(S): Unable to login and random hangs during system startup.
-------------------------------------------------------------------------
B1) SPARC64 T7-1: Kernel v7.1.0-rc2
lscpu;uname -a
Architecture:          sparc64
   CPU op-mode(s):      32-bit, 64-bit
   Byte Order:          Big Endian
CPU(s):                256
   On-line CPU(s) list: 0-255
Model name:            SPARC-M7
   Thread(s) per core:  8
   Core(s) per socket:  32
   Socket(s):           1
   Flags:               sun4v
Caches (sum of all):
   L1d:                 4 MiB (256 instances)
   L1i:                 4 MiB (256 instances)
   L2:                  64 MiB (256 instances)
Linux s7t7-debian-test 7.1.0-rc2-test01 #1 SMP Fri May  8 10:02:12 PDT 
2026 sparc64 GNU/Linux

   526.766867] rcu:     8-...!: (806 GPs behind) idle=069c/0/0x1 
softirq=682/682 fqs=0
[  526.781618] rcu:     22-...!: (0 ticks this GP) idle=7b40/0/0x0 
softirq=739/739 fqs=0 (false positive?)
[  526.799841] rcu:     89-...!: (770 GPs behind) idle=7800/0/0x0 
softirq=270/273 fqs=0 (false positive?)
[  526.817901] rcu:     112-...!: (225 GPs behind) idle=c0c8/0/0x0 
softirq=193/193 fqs=0 (false positive?)
[  526.836131] rcu:     189-...!: (0 ticks this GP) idle=8ef0/0/0x0 
softirq=1016/1016 fqs=0 (false positive?)
[  526.854885] rcu:     204-...!: (0 ticks this GP) idle=5d20/0/0x0 
softirq=774/774 fqs=0 (false positive?)
[  526.873278] rcu:     219-...!: (225 GPs behind) idle=d580/0/0x0 
softirq=605/607 fqs=0 (false positive?)
[  526.891508] rcu:     226-...!: (233 GPs behind) idle=ec08/0/0x0 
softirq=1189/1190 fqs=0 (false positive?)
[  526.910079] rcu:     (detected by 157, t=5289 jiffies, g=5989, q=5339 
ncpus=256)
[  526.924916] rcu: rcu_sched kthread timer wakeup didn't happen for 
5295 jiffies! g5989 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  526.946930] rcu:     Possible timer handling issue on cpu=94 
timer-softirq=279
[  526.960818] rcu: rcu_sched kthread starved for 5302 jiffies! g5989 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=94
[  526.981300] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  526.999182] rcu: RCU grace-period kthread stack dump:
[  527.009301] rcu: Stack dump where RCU GP kthread last ran:
[  548.035259] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  548.046861] rcu:     8-...!: (807 GPs behind) idle=071c/0/0x1 
softirq=682/682 fqs=0
[  548.061608] rcu:     17-...!: (0 ticks this GP) idle=00e8/0/0x0 
softirq=812/812 fqs=0 (false positive?)
[  548.079831] rcu:     84-...!: (0 ticks this GP) idle=d2b0/0/0x0 
softirq=797/797 fqs=0 (false positive?)
[  548.098070] rcu:     89-...!: (771 GPs behind) idle=7be8/0/0x0 
softirq=270/273 fqs=0 (false positive?)
[  548.116122] rcu:     112-...!: (226 GPs behind) idle=c110/0/0x0 
softirq=193/193 fqs=0 (false positive?)
[  548.134342] rcu:     185-...!: (0 ticks this GP) idle=45b8/0/0x0 
softirq=871/871 fqs=0 (false positive?)
[  548.152759] rcu:     193-...!: (0 ticks this GP) idle=1758/0/0x0 
softirq=1520/1520 fqs=0 (false positive?)
[  548.171509] rcu:     205-...!: (0 ticks this GP) idle=1e98/0/0x0 
softirq=852/852 fqs=0 (false positive?)
[  548.189893] rcu:     219-...!: (226 GPs behind) idle=d5c8/0/0x0 
softirq=605/607 fqs=0 (false positive?)
[  548.208128] rcu:     226-...!: (234 GPs behind) idle=eff0/0/0x0 
softirq=1189/1190 fqs=0 (false positive?)
[  548.226699] rcu:     (detected by 115, t=5300 jiffies, g=5993, q=5539 
ncpus=256)
[  548.241699] rcu: rcu_sched kthread timer wakeup didn't happen for 
5303 jiffies! g5993 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  548.263704] rcu:     Possible timer handling issue on cpu=94 
timer-softirq=279
[  548.277593] rcu: rcu_sched kthread starved for 5311 jiffies! g5993 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=94
[  548.298081] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  548.315971] rcu: RCU grace-period kthread stack dump:
[  548.326084] rcu: Stack dump where RCU GP kthread last ran:
[  569.343268] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  569.354868] rcu:     8-...!: (808 GPs behind) idle=07ac/0/0x1 
softirq=682/682 fqs=0
[  569.369617] rcu:     89-...!: (772 GPs behind) idle=8518/0/0x0 
softirq=270/273 fqs=0 (false positive?)
[  569.387674] rcu:     112-...!: (227 GPs behind) idle=c168/0/0x0 
softirq=193/193 fqs=0 (false positive?)
[  569.405894] rcu:     219-...!: (227 GPs behind) idle=d620/0/0x0 
softirq=605/607 fqs=0 (false positive?)
[  569.424128] rcu:     226-...!: (235 GPs behind) idle=f920/0/0x0 
softirq=1189/1190 fqs=0 (false positive?)
[  569.442700] rcu:     (detected by 76, t=5276 jiffies, g=5997, q=5665 
ncpus=256)
[  569.457146] rcu: rcu_sched kthread timer wakeup didn't happen for 
5278 jiffies! g5997 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  569.479149] rcu:     Possible timer handling issue on cpu=94 
timer-softirq=279
[  569.493043] rcu: rcu_sched kthread starved for 5285 jiffies! g5997 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=94
[  569.513534] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  569.531419] rcu: RCU grace-period kthread stack dump:
[  569.541536] rcu: Stack dump where RCU GP kthread last ran:
[  590.563260] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  590.574870] rcu:     8-...!: (809 GPs behind) idle=0824/0/0x1 
softirq=682/682 fqs=0
[  590.589618] rcu:     89-...!: (773 GPs behind) idle=8850/0/0x0 
softirq=270/273 fqs=0 (false positive?)
[  590.607682] rcu:     112-...!: (228 GPs behind) idle=c198/0/0x0 
softirq=193/193 fqs=0 (false positive?)
[  590.625904] rcu:     195-...!: (0 ticks this GP) idle=7178/0/0x0 
softirq=1038/1038 fqs=0 (false positive?)
[  590.644660] rcu:     207-...!: (0 ticks this GP) idle=9440/0/0x0 
softirq=809/809 fqs=0 (false positive?)
[  590.663056] rcu:     219-...!: (228 GPs behind) idle=d650/0/0x0 
softirq=605/607 fqs=0 (false positive?)
[  590.681285] rcu:     226-...!: (236 GPs behind) idle=fc78/0/0x0 
softirq=1189/1190 fqs=0 (false positive?)
[  590.699859] rcu:     (detected by 138, t=5286 jiffies, g=6001, q=5524 
ncpus=256)
[  590.714623] rcu: rcu_sched kthread timer wakeup didn't happen for 
5288 jiffies! g6001 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  590.736635] rcu:     Possible timer handling issue on cpu=94 
timer-softirq=279
[  590.750524] rcu: rcu_sched kthread starved for 5296 jiffies! g6001 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=94
[  590.771021] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  590.788903] rcu: RCU grace-period kthread stack dump:
[  590.799012] rcu: Stack dump where RCU GP kthread last ran:
[  606.363275] INFO: task kworker/u1024:0:12 blocked for more than 483 
seconds.
[  606.377139]       Tainted: G        W  7.1.0-rc2-test01 #1
[  606.389636] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  611.823259] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  611.834860] rcu:     8-...!: (810 GPs behind) idle=08bc/0/0x1 
softirq=682/682 fqs=0
[  611.849612] rcu:     89-...!: (774 GPs behind) idle=91a8/0/0x0 
softirq=270/273 fqs=0 (false positive?)
[  611.867665] rcu:     112-...!: (229 GPs behind) idle=c1d8/0/0x0 
softirq=193/193 fqs=0 (false positive?)
[  611.885887] rcu:     205-...!: (0 ticks this GP) idle=2160/0/0x0 
softirq=865/865 fqs=0 (false positive?)
[  611.904290] rcu:     219-...!: (229 GPs behind) idle=d690/0/0x0 
softirq=605/607 fqs=0 (false positive?)
[  611.922525] rcu:     226-...!: (237 GPs behind) idle=05e0/0/0x0 
softirq=1189/1190 fqs=0 (false positive?)
[  611.941095] rcu:     (detected by 166, t=5283 jiffies, g=6005, q=5522 
ncpus=256)
[  611.955789] rcu: rcu_sched kthread timer wakeup didn't happen for 
5285 jiffies! g6005 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  611.977793] rcu:     Possible timer handling issue on cpu=94 
timer-softirq=279
[  611.991685] rcu: rcu_sched kthread starved for 5292 jiffies! g6005 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=94
[  612.012174] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  612.030060] rcu: RCU grace-period kthread stack dump:
[  612.040180] rcu: Stack dump where RCU GP kthread last ran:

r[  727.195272] INFO: task kworker/u1024:0:12 blocked for more than 604 
seconds.
[  727.209134]       Tainted: G        W  7.1.0-rc2-test01 #1
[  727.221628] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.

NOTE(S): Random hangs and same messages as S7-2. Takes about 15 minutes 
to see the messages.
---------------------------------------------------------
B2) SPARC64 T7-1 Kernel v7.0.4
[  OK  ] Finished e2scrub_reap.service - Remove Stale Online ext4 
Metadata Check Snapshots.

Debian GNU/Linux forky/sid s7t7-debian-test ttyHV0

s7t7-debian-test login: tonyr
Password:
Linux s7t7-debian-test 7.0.4-test01 #1 SMP Fri May  8 09:27:58 PDT 2026 
sparc64
[..]
Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
[   79.468871] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[   79.480483] rcu:     114-...!: (424 GPs behind) idle=8760/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[   79.498713] rcu:     (detected by 90, t=5259 jiffies, g=3769, q=818 
ncpus=256)
[   79.512702] rcu: rcu_sched kthread timer wakeup didn't happen for 
5260 jiffies! g3769 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[   79.534808] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[   79.548516] rcu: rcu_sched kthread starved for 5267 jiffies! g3769 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[   79.568838] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[   79.586709] rcu: RCU grace-period kthread stack dump:
[   79.596867] rcu: Stack dump where RCU GP kthread last ran:
[  100.612874] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  100.624477] rcu:     114-...!: (425 GPs behind) idle=88f0/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[  100.642709] rcu:     157-...!: (0 ticks this GP) idle=4c08/0/0x0 
softirq=122/122 fqs=0 (false positive?)
[  100.661106] rcu:     (detected by 3, t=5264 jiffies, g=3773, q=1046 
ncpus=256)
[  100.675155] rcu: rcu_sched kthread timer wakeup didn't happen for 
5265 jiffies! g3773 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  100.697211] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[  100.710934] rcu: rcu_sched kthread starved for 5276 jiffies! g3773 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[  100.731244] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  100.749125] rcu: RCU grace-period kthread stack dump:
[  100.759255] rcu: Stack dump where RCU GP kthread last ran:
login: ti[  121.776867] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  121.788467] rcu:     114-...!: (426 GPs behind) idle=8a20/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[  121.806703] rcu:     (detected by 3, t=5259 jiffies, g=3777, q=1267 
ncpus=256)
[  121.820664] rcu: rcu_sched kthread timer wakeup didn't happen for 
5260 jiffies! g3777 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  121.842799] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[  121.856521] rcu: rcu_sched kthread starved for 5271 jiffies! g3777 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[  121.876836] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  121.894717] rcu: RCU grace-period kthread stack dump:
[  121.904824] rcu: Stack dump where RCU GP kthread last ran:
[  142.920877] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  142.932481] rcu:     114-...!: (427 GPs behind) idle=8b98/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[  142.950709] rcu:     158-...!: (1 GPs behind) idle=5220/0/0x0 
softirq=142/148 fqs=0 (false positive?)
[  142.968586] rcu:     (detected by 122, t=5260 jiffies, g=3781, q=722 
ncpus=256)
[  142.982808] rcu: rcu_sched kthread timer wakeup didn't happen for 
5265 jiffies! g3781 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  143.004857] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[  143.018583] rcu: rcu_sched kthread starved for 5273 jiffies! g3781 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[  143.038893] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  143.056761] rcu: RCU grace-period kthread stack dump:
[  143.066898] rcu: Stack dump where RCU GP kthread last ran:
[  164.084863] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  164.096463] rcu:     14-...!: (0 ticks this GP) idle=56b0/0/0x0 
softirq=165/165 fqs=0 (false positive?)
[  164.114695] rcu:     114-...!: (428 GPs behind) idle=8ed0/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[  164.132916] rcu:     (detected by 96, t=5264 jiffies, g=3785, q=750 
ncpus=256)
[  164.146969] rcu: rcu_sched kthread timer wakeup didn't happen for 
5265 jiffies! g3785 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  164.169019] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[  164.182728] rcu: rcu_sched kthread starved for 5276 jiffies! g3785 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[  164.203055] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  164.220922] rcu: RCU grace-period kthread stack dump:
[  164.231039] rcu: Stack dump where RCU GP kthread last ran:
[  185.248867] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  185.260468] rcu:     21-...!: (0 ticks this GP) idle=36c8/0/0x0 
softirq=154/154 fqs=0 (false positive?)
[  185.278684] rcu:     114-...!: (429 GPs behind) idle=8f68/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[  185.296922] rcu:     (detected by 116, t=5264 jiffies, g=3789, q=760 
ncpus=256)
[  185.311140] rcu: rcu_sched kthread timer wakeup didn't happen for 
5265 jiffies! g3789 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  185.333205] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[  185.346918] rcu: rcu_sched kthread starved for 5276 jiffies! g3789 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[  185.367224] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  185.385113] rcu: RCU grace-period kthread stack dump:
[  185.395229] rcu: Stack dump where RCU GP kthread last ran:
   OK  ] Reached target network-online.target - Network is Online.
[  OK  ] Started anacron.service - Run anacron jobs.
[  OK  ] Started cups-browsed.service - Make remote CUPS printers 
available locally.
          Starting exim4.service - exim Mail Transport Agent...
          Starting xrdp.service - xrdp daemon...
[  OK  ] Finished user-runtime-dir@1000.service - User Runtime Directory 
/run/user/1000.
[  OK  ] Started xrdp.service - xrdp daemon.
[  OK  ] Started serial-getty@ttyHV0.service - Serial Getty on ttyHV0.
          Starting user@1000.service - User Manager for UID 1000...
[  OK  ] Started exim4.service - exim Mail Transport Agent.
[  OK  ] Reached target multi-user.target - Multi-User System.
[  OK  ] Reached target graphical.target - Graphical Interface.
[  OK  ] Started user@1000.service - User Manager for UID 1000.
[FAILED] Failed to start session-1.scope - Session 1 of User tonyr.
See 'systemctl status session-1.scope' for details.
[  206.412865] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  206.424477] rcu:     114-...!: (430 GPs behind) idle=97b0/0/0x0 
softirq=126/126 fqs=0 (false positive?)
[  206.442691] rcu:     (detected by 123, t=5259 jiffies, g=3793, q=5473 
ncpus=256)
[  206.457056] rcu: rcu_sched kthread timer wakeup didn't happen for 
5261 jiffies! g3793 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  206.479157] rcu:     Possible timer handling issue on cpu=2 
timer-softirq=330
[  206.492868] rcu: rcu_sched kthread starved for 5271 jiffies! g3793 
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=2
[  206.513173] rcu:     Unless rcu_sched kthread gets sufficient CPU 
time, OOM is now expected behavior.
[  206.531061] rcu: RCU grace-period kthread stack dump:
[  206.541202] rcu: Stack dump where RCU GP kthread last ran:

NOTE(S): Unable to login and random hangs during system startup. Same 
messages/issues as S7-2.

>
> On 5/8/26 12:50 AM, Thorsten Leemhuis wrote:
>> [+tglx so he knows about it; details about the problem that Tony faces
>> can be found in https://github.com/sparclinux/issues/issues/79 ]
>>
>> On 5/8/26 09:38, Tony Rodriguez wrote:
>>> I still don't believe this is fixed upstream as of v7.03 and v7.1-rc1,
>> Yes and no. It looks like d6e152d905bdb1 ("clockevents: Prevent timer
>> interrupt starvation") causes two regression.
>>
>> Thomas fixed one with 4096fd0e8eaea1 ("clockevents: Add missing resets
>> of the next_event_forced flag") -- and feedback shows that it definitely
>> solved the problem for quite a few people. If that's not the case for
>> you, then you seem to face a different problem caused by the same
>> change. Happens, that's life sometimes.
>>
>> Ciao, Thorsten
>>
>>> only when my patch is applied does the SPARC64 S7-2 system become 
>>> stable
>>> again. I also tested my patch with v7.0.4 and it works their as well.
>>> Will perform additional tests without my fix against v7.0.4 and 
>>> v7.1-rc2
>>> later today to revalidate the regression (USA Pacific time).
>>>
>>> Tony Rodriguez
>>> www.linkedin.com/in/unixpro1970
>>>
>>>> On May 7, 2026, at 11:33 PM, Thorsten Leemhuis <linux@leemhuis.info>
>>>> wrote:
>>>>
>>>> ﻿On 5/8/26 07:51, John Paul Adrian Glaubitz wrote:
>>>>> On Thu, 2026-04-23 at 18:30 +0200, Thorsten Leemhuis wrote:
>>>>>> FWIW, here is the rough timeline of the regression, just to be 
>>>>>> sure we
>>>>>> are all on the same page:
>>>>>>
>>>>>> * The regression I'm talking about is caused by d6e152d905bdb1
>>>>>> ("clockevents: Prevent timer interrupt starvation") [authored:
>>>>>> 2026-04-07 10:54:17; committed: 2026-04-10 22:45:38; next arrival:
>>>>>> next-20260413; merged: 2026-04-12 19:01:55; v7.0 (2026-04-12 
>>>>>> 22:48:06)]
>>>>> [...]
>>>>> Tony Rodriguez from the SPARC community has observed the regression
>>>>> on SPARC as well
>>>>> and proposed a fix to address it [1]. Not sure whether he has
>>>>> retested on the latest
>>>>> commit of Linus' tree yet.
>>>>>
>>>>> Tony, can you verify that 4096fd0e8eaea1 fixes the issue for you?
>>>>>
>>>>>> [1] https://github.com/sparclinux/issues/issues/79
>>>> It's likely a different regressions, as that report's title says that
>>>> v7.0.1, v7.0.2, v7.0.3, and v7.1‑rc1 are affected, which all 
>>>> contain the
>>>> fix, aka 4096fd0e8eaea1. Reporting in a new thread is likely best, as
>>>> the authors of the culprit are not even CCed here.
>>>>
>>>> Ciao, Thorsten
