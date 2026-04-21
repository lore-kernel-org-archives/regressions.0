Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD4318140
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776748243; cv=none; b=ldGUM/99ssDMBGe9OCa9U3oEu2bJET/g9seiHIRa7P/mQ3W6pLpbEFXxshgu0npK1pXTOEVL1SCHowcq4drVDcMx6HI6J4J4N7vbE1wetJm7G12+8dfmp3edDqnhMBfD3gE5ZoZ1fpnDzyAkBIYqxG0GmwWGE10rzoh8D5f0Bu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776748243; c=relaxed/simple;
	bh=2+X7wH56uP+7PA51+orUA5FPLnSiJ3wUH+8mi/UPhIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o184L7k1XsTI6p28k3j0qWmFcV/k7HXVglYAEf1368hOOGuYvVtHfHkER3FZb+O9FiywMUvsprS4LP89Q/CXP6yGwl6paVgJw7PCZHKO/VvNKe3uCGWtL23UBSG44J7JGkNdEKbumejBKn1aX3w5QlGYxtQJ8tVanUk/I9Vh1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=NhJk/U9C; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="NhJk/U9C"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4g09FJ3sqbz87gF;
	Tue, 21 Apr 2026 07:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776747716;
	bh=2+X7wH56uP+7PA51+orUA5FPLnSiJ3wUH+8mi/UPhIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NhJk/U9Cmn2oXJAKN7rjRO4FWXf9Igg6Rd0eysyrayXe4OrXmACezFCJeYfzYiLHU
	 3e+BosrH8dZjVtsyjeTHU2R3H3komQYCXPS5dyYFhI2N4ErktgveiRVMv0CFRELtHv
	 Am7VoNLpKZLLPy++CZskWsU5gQ7UTSV89tCx0QdYJsy8REDwHxltxkZWuBSW3CkuNH
	 pwlrYWuop2MNI2AcS7KmmkeUH3zZXTGshSIhRGS5f/rFGCr05VM8iurVr3DHyTw2AM
	 EjqgGPl7iO77Vj3ScLP0PySPROZMXJ9Z5SU3MAj+UKbqCGlUROySi3tj1Yyp7+/ldj
	 FQ0JGY61NQweA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4g09FJ390Qz4xKt;
	Tue, 21 Apr 2026 07:01:56 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g09FH52tnz8sZP;
	Tue, 21 Apr 2026 07:01:55 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 138C1635A6;
	Tue, 21 Apr 2026 07:01:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1c4a7145-d9d0-44d5-8f19-03d58c89b9cb@leemhuis.info>
Date: Tue, 21 Apr 2026 07:01:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Sagatov, Evgeniy" <esagatov@amt.ru>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Michal Wilczynski <michal.wilczynski@intel.com>
References: <c64d69bb-9df9-46b7-a1ad-aada30310d36@leemhuis.info>
 <26521776666243@mail.yandex.ru> <d161effaca5a456dabcfbb7dbbf105d8@amt.ru>
 <d274394d-2282-412e-80ad-bbe2c1a41b8a@leemhuis.info>
 <34758f5c98864b8281cf89c30602981a@amt.ru>
 <773df6e6f0bd4120b9e39d51559ce6a8@amt.ru>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <773df6e6f0bd4120b9e39d51559ce6a8@amt.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177674771434.4075278.4364186362584113682@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 138C1635A6
X-NC-CID: RpzY13Xkmv41H0/y6gVJybwdRKxmMHMYVSPnGHwodvE2szVSSd8=

On 4/21/26 00:20, Sagatov, Evgeniy wrote:
> I'd also like to point out that without this patch, single-core CPU performance does drop.
> In my case, it dropped by 30%. I tested it using 7z, stress-ng and sysbench.
> 
> -----Original Message-----
> From: Sagatov, Evgeniy 
> Sent: Monday, April 20, 2026 10:35 PM
> To: 'Thorsten Leemhuis' <regressions@leemhuis.info>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>; regressions@lists.linux.dev; LKML <linux-kernel@vger.kernel.org>; Michal Wilczynski <michal.wilczynski@intel.com>
> Subject: RE: Pressing the power button causes the device to freeze completely
> 
> 8c94ccc7cd691472461448f98e2372c75849406c    good
> e37617c8e53a1f7fcba6d5e1041f4fd8a2425c27    good
> b0d326da462e20285236e11e4cbc32085de9f363    bad
> 
> I also built the stock Debian 13 kernel, version 6.12.74, and reverted commit b0d326da462e20285236e11e4cbc32085de9f363.
> The PC shuts down without any issues with this kernel when pressing the power button.

Maybe there is nothing wrong with the code in those areas here, as it
might be a timing issue influenced by the performance change. But this
is not my domain, so consider that a wild guess -- Rafael might be
better judge here.

Overall I fear there might be not much we can do, unless someone comes
up with ideas how to debug the real issue.

Ciao, Thorsten

> -----Original Message-----
> From: Thorsten Leemhuis <regressions@leemhuis.info>
> Sent: Monday, April 20, 2026 9:55 AM
> To: Sagatov, Evgeniy <esagatov@amt.ru>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>; regressions@lists.linux.dev; LKML <linux-kernel@vger.kernel.org>; Michal Wilczynski <michal.wilczynski@intel.com>
> Subject: Re: Pressing the power button causes the device to freeze completely
> 
> On 4/20/26 08:41, Sagatov, Evgeniy wrote:
>> Hello Thorsten,
>>
>> Thanks for the detailed manual!
>>
>> I determined that the problem started between versions 6.7.12 and 6.8-rc1. Then I ran a 'git bisect' according to the manual.
>>
>> Result:
>> b0d326da462e20285236e11e4cbc32085de9f363 is the first bad commit 
>> commit b0d326da462e20285236e11e4cbc32085de9f363
>> Merge: 8c94ccc7cd69 e37617c8e53a
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Thu Jan 18 11:57:33 2024 -0800
>>
>>     Merge tag 'sched-urgent-2024-01-18' of 
>> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> This is a merge commit. This might be right, but often it is not. Can you please retest commits 8c94ccc7cd691472461448f98e2372c75849406c,
> e37617c8e53a1f7fcba6d5e1041f4fd8a2425c27 and
> b0d326da462e20285236e11e4cbc32085de9f363 just to be sure and then share your results? tia!
> 
> Ciao Thorsten
> 
>>     Pull scheduler fix from Ingo Molnar:
>>      "Fix a cpufreq related performance regression on certain systems, where
>>       the CPU would remain at the lowest frequency, degrading performance
>>       substantially"
>>
>>     * tag 'sched-urgent-2024-01-18' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip:
>>       sched/fair: Fix frequency selection for non-invariant case
>>
>>  kernel/sched/cpufreq_schedutil.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> ----
>> Sincerely, Evgeny Sagatov
>>
>>  ----------------
>> 16.04.2026, 20:35, Thorsten Leemhuis (mailto:regressions@leemhuis.info):
>> To: Evgeny Sagatov (mailto:sagatov@ya.ru), Rafael J. Wysocki 
>> (mailto:rafael.j.wysocki@intel.com);
>> Copy: mailto:regressions@lists.linux.dev, LKML 
>> (mailto:linux-kernel@vger.kernel.org), Michal Wilczynski 
>> (mailto:michal.wilczynski@intel.com);
>> Topic: Pressing the power button causes the device to freeze 
>> completely;
>>  
>> On 4/16/26 19:22, Evgeny Sagatov wrote:
>>  Could you please try 7.0 as well?
>>  I compiled 7.0.0 kernel from sources.
>>  Unfortunately, this kernel also freezes when the power button is pressed.
>>
>> Thx for testing.
>>   
>>  How did you find that this causes the problem? Did you do a proper
>>  bisection and thus checked if the parent of that commit really works?
>>   
>>  I don't think I did it correctly.
>>  Because the previous commits didn't shut down the PC or cause it to
>>  freeze. I think they just weren't working.
>>   
>>  I also tried a very simple module tity-power-button. Pressing the 
>> power
>>  button when using this module also causes a full freeze.
>>  I think the problem lies with the ACPI functionality, but none of 
>> kernel
>>  options helped fix it.
>>   
>>  I'm confused.
>>
>> Then you likely want to properly bisect the bug. Might be best to do 
>> that on a Debian 12 install (where everything used to be working) by 
>> following this guide:
>>
>> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions
>> .html
>>
>> But be warned: the regression is old. Even if the culprit is 
>> identified the usual rules wrt to "no regression" might not apply, as 
>> fixing the regression could cause regressions for other users.
>>
>> Ciao, Thorsten
>>  
>>  ----------------
>>  To: Evgeny Sagatov (mailto:sagatov@ya.ru), Rafael J. Wysocki
>>  (mailto:rafael.j.wysocki@intel.com);
>>  Copy: mailto:regressions@lists.linux.dev, LKML 
>> (mailto:linux-kernel@vger.kernel.org),
>>  Michal Wilczynski (mailto:michal.wilczynski@intel.com);
>>  Topic: Pressing the power button causes the device to freeze 
>> completely;
>>  16.04.2026, 11:23, "Thorsten Leemhuis" <mailto:regressions@leemhuis.info>:
>>  
>>      [removing the stable list, this is not something for them]
>>  
>>      On 4/13/26 18:46, Evgeny Sagatov wrote:
>>  
>>           I have a PC with a motherboard GA-EP45T-UD3LR (Rev. 1.0) 
>> <https://
>>           https://www.gigabyte.com/Motherboard/GA-EP45T-UD3LR-rev-10
>> <https://
>>          https://www.gigabyte.com/Motherboard/GA-EP45T-UD3LR-rev-10>>
>> and
>>          processor Intel
>>           Core 2 Quad Q9550.
>>           Previously, I had Debian 12 with kernel 6.1 installed, and
>>          pressing the
>>           power button would shut down the PC as usual.
>>           I updated to Debian 13 with kernel 6.12.74, and now pressing
>>          the power
>>           button causes the PC to freeze completely.
>>            
>>           I see that systemd doesn't even begin to shut down. It 
>> freezes
>>           immediately after pressing the button. There's no error 
>> message in
>>           console. There's no error message in the logs either.
>>          Netconsole doesn't
>>           report any errors, and the kernel doesn't panic. It just
>>          freezes completely.
>>            
>>           I checked that Live CD with Debian 12 continue to shut down
>>          normally,
>>           but Live CD with Debian 13 freeze.
>>           I tried updating and resetting the BIOS. I tried various 
>> kernel
>>           parameters related to ACPI settings. I also tried kernels
>> 6.18
>>          and 6.19.
>>           Nothing fixed the problem.
>>  
>>  
>>      Could you please try 7.0 as well? It contains a fix for the 
>> commit you
>>      mentioned below.
>>       
>>  
>>            
>>           If I unload the "button" module, the system doesn't freeze, 
>> but
>>          it also
>>           doesn't shut down.
>>           I built "button" module by rolling back its version to 
>> commit
>>          1a20d40
>>           <https://github.com/torvalds/linux/ <https://github.com/
>>          torvalds/linux/>
>>           commit/1a20d409c874255086e2f42a729826d490294c91>, which
>>          corresponds to
>>           kernel version 6.1. This module does not freeze, but does 
>> not
>>          turn off
>>           the PC either.
>>            
>>           I've found that the freezes have been occurring since commit
>>          0d51157
>>           <https://github.com/torvalds/linux/ <https://github.com/
>>          torvalds/linux/>
>>           commit/0d51157dfaac05ea66616d8a250dce04bef49a4f>.
>>  
>>  
>>      That is 0d51157dfaac05 ("ACPI: button: Eliminate the driver 
>> notify
>>      callback") [v6.5-rc1] from Rafael. But that is a very old commit; 
>> and
>>      you seem to be switching distro versions and kernel at the same 
>> time,
>>      which could interfere.
>>  
>>      How did you find that this causes the problem? Did you do a 
>> proper
>>      bisection and thus checked if the parent of that commit really works?
>>       
>>  
>>           Unfortunately, my skills are not enough to understand the
>>          reason for the
>>           freeze.
>>            
>>           I'm attaching dmesg and lspci logs.
>>  
>>      Ciao, Thorsten
>>
> 
> 

