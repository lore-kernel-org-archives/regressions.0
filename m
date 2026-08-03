Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F71390CB4;
	Mon,  3 Aug 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775571; cv=none; b=hfvEtwhnKCG4Ksg26tRxR3hj7ClSVWMJVcxz932Xzf2frCd/oBem1Un5zUDTOTcvxVHkobpQiwhpikMO3lbX3xtsjCNKQE18vlDE6He++2BHGFACSJlulDBVifRZ+9HYF5SQt5IdkrHoZMQWYGv6MZO/DCurz9J5JkOk9zsx2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775571; c=relaxed/simple;
	bh=F0lnlJsWFNAUXIOKXfQaWjO1pNnnOibsqUn/q02g2+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1QC4aQpTHCTmInywhw93lOZsVsA7K3Xnsexexu4OAqv1hcuCMvg9O6Jy3TJtxuah7jzGSvXP8Vkic1cRXAhcZjgmoKZ6Ol+B0T/u1myF7PH4QTUoUO/c+XGSz+8g2De6gLVa34WLJON8aOu27K2admFX+EJM1jsbWWLSpEKr5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=JDEHwVbf; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="JDEHwVbf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=zg6mGQ9Qy/W2eFUCQmgqkAbntH7MTgnJEXtuNGzzzFU=; b=JDEHwVbfPMAG6BcJ
	hWbDazWWo9BSvOq4axBW4cS1/eKWyopbP+RsTtz/iwxhlpQG7UB9p2VSqm7RRicldCj9yCSAXGbem
	c7pkMLRpcuRPnTfTfcDZkYEY1lYIKb5di6dDX7+ZJtfWVanv7MIB46iH06OwmwiOCQ38itAxveZq8
	gfwrWnmcYt9qQGF+dl6ArEt+ikaiRAgGCHBW0qrciNxFuNEzGDNKUCeMO80HueJmoAGTKGl+B57jk
	q++d9SLNSUdvhCy52lmHdYn9kpLk9+WPlUMGxOUOUQoSMvcCqwUz2d4uSZVgLZEt2jY0wsOFVjnyB
	ZkAT4LEDUyytr29nKw==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1wqvna-00000000ah7-3hln;
	Mon, 03 Aug 2026 16:45:58 +0000
Date: Mon, 3 Aug 2026 16:45:58 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: tglx@kernel.org, jstultz@google.com, sboyd@kernel.org
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] Random 'clocksource: Watchdog remote CPU ?? read timed
 out'
Message-ID: <anDFxqll6Pb05RmC@gallifrey>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.100+deb13-amd64 (x86_64)
X-Uptime: 16:36:17 up 2 days, 22:38,  2 users,  load average: 0.09, 0.04, 0.01
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi all,
  I've noticed in my logs on every boot since 7.1.x a:

[    6.749566] clocksource: Watchdog remote CPU 11 read timed out

with the CPU being different each time.  There's no apparent bad
side effects or anything, but it seemed worth reporting and I noticed
It's only one each boot as far as I can tell.

I checked back through journalctl -b -...  and the first time I got
it was the first 7.1.x boot, and I remember seeing this during rc's
as well but that was on a bit of a random build.

The current ones are happening on Fedora's 7.1.5-201.fc44.x86_64

dg@dalek:~$ sudo dmesg|grep -i watchdog 
[    0.381705] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    2.244379] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    2.253962] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    6.749566] clocksource: Watchdog remote CPU 11 read timed out
dg@dalek:~$ sudo journalctl -b -1 |grep -i Watchdog
Aug 02 11:52:48 dalek kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Aug 02 11:52:49 dalek kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Aug 02 11:52:49 dalek kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
Aug 02 11:53:00 dalek rtkit-daemon[1703]: Watchdog thread running.
Aug 02 11:53:17 dalek kernel: clocksource: Watchdog remote CPU 26 read timed out
dg@dalek:~$ sudo journalctl -b -2 |grep -i Watchdog
Aug 01 12:14:48 dalek kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Aug 01 12:14:49 dalek kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Aug 01 12:14:49 dalek kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
Aug 01 12:15:00 dalek rtkit-daemon[1697]: Watchdog thread running.
Aug 01 12:15:16 dalek kernel: clocksource: Watchdog remote CPU 24 read timed out
dg@dalek:~$ sudo journalctl -b -3 |grep -i Watchdog
Jul 31 12:16:33 dalek kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
Jul 31 12:16:34 dalek kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
Jul 31 12:16:34 dalek kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
Jul 31 12:16:44 dalek rtkit-daemon[1696]: Watchdog thread running.
Jul 31 12:16:48 dalek kernel: clocksource: Watchdog remote CPU 31 read timed out

dg@dalek:~$ lscpu
Architecture:                x86_64
  CPU op-mode(s):            32-bit, 64-bit
  Address sizes:             43 bits physical, 48 bits virtual
  Byte Order:                Little Endian
CPU(s):                      32
  On-line CPU(s) list:       0-31
Vendor ID:                   AuthenticAMD
  Model name:                AMD Ryzen 9 3950X 16-Core Processor
    CPU family:              23
    Model:                   113
    Thread(s) per core:      2
    Core(s) per socket:      16
    Socket(s):               1
    Stepping:                0
    Frequency boost:         enabled
    CPU(s) scaling MHz:      50%
    CPU max MHz:             4761.2300
    CPU min MHz:             2200.0000
    BogoMIPS:                6986.90
    Flags:                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr
                              sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl xto
                             pology nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx1
                             6 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr
                             8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_cor
                             e perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibpb stibp vm
                             mcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsav
                             eopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsav
                             eerptr rdpru wbnoinvd arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid 
                             decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip rdpid o
                             verflow_recov succor smca sev sev_es

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
