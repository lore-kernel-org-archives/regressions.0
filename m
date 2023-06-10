Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601E408C7
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 06:32:06 +0000 (UTC)
Received: from mars.fo.jb.local ([188.174.1.218]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis) id
 1M8yso-1qBiAE0HBe-0067We for <regressions@lists.linux.dev>; Sat, 10 Jun 2023
 08:32:04 +0200
Received: from localhost (unknown [127.0.0.1])
	by mars.fo.jb.local (Postfix) with ESMTP id 6C5B817F700
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 06:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at jmbreuer.net
Received: from mars.fo.jb.local ([127.0.0.1])
	by localhost (mars.jmbreuer.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fcF1aHMpcUE for <regressions@lists.linux.dev>;
	Sat, 10 Jun 2023 08:31:56 +0200 (CEST)
Received: from sol.fo.jb.local (sol.fo.jb.local [192.168.23.1])
	by mars.fo.jb.local (Postfix) with ESMTP id A820F17F413
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 08:31:56 +0200 (CEST)
Received: from [192.168.23.25] (mars.fo.jb.local [192.168.23.254])
	by sol.fo.jb.local (Postfix) with ESMTPSA id 9E1E4604E111
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 08:31:56 +0200 (CEST)
Message-ID: <7a3b3a7e-cf69-a60a-8790-59ca4393292b@jmbreuer.net>
Date: Sat, 10 Jun 2023 08:31:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: Waking up from resume locks up on sr device
Content-Language: en-US
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
From: Joe Breuer <linux-kernel@jmbreuer.net>
To: regressions@lists.linux.dev
Organization: Joachim Breuer EDV
In-Reply-To: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:644lj9w8yjDJ3qsnsMQZe2job0fVZMjvxX+HIZqoqFHSrH5Y1Hl
 09PVRieIAJqDks+4LBZ2P8icfHku0CJtGV4g1I/EB836C6ZUozqNnferpE/imYSRXn65Ozs
 I8aJQgm2NOZ9+qewNZZokOxqxcEDIjsgJYQF3S6/Ll98/qmVh7j6Hqf7xZ3m4LNFRZmzyah
 oH0hFhG1a9JPGG/prbAvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jGnG79vVI+k=;rbeC1Gp8KcWkOXrXSq2De5OXhJw
 dr9Sk8zRdDoFluyaiB5htb2rAjS4jAB06euRH0Iv+1gkscQ+N5hS0LyBd23s+PDXnSjkdKR5G
 JG1aNggONz5f/KyjU1BMOcfL14AxcK9wVo3VjTmDB5oI5RAGsjdIprwgdOlm8u34iVu10DSSg
 WEHTBHFlxREuboZuUKZyWstGN+tpIh2QKlWucwwNIl0DTolECsX03UYomn/8W7/kq/DFhEplO
 5N+K3uQf46YvVSMLFpWXLxpDzlCnUMa4Uq3juURBZGa60ceQL8cdBqsrHmP4MuqRT0k50K3f/
 ECYaUb5ZCXrwNhhjPYyIvrHXbbTHBVFnXJmzgMCrdE4zsU/PMtmSrVMNz37Oy8tRc7QMXdXnO
 oLWlGA6sOmHPhDZojXkRZZc8gudeOse9E39kCfDpWvjN5v1XH2iMXzezCRdSvDPxDIKqHKOLk
 YcHJu2iHZO+hnB5PtkwOPuRwaJYlCAbrhh1RLnhUTR518d7mhWC9xKjqJOfm5uGIeS29z4l+N
 xzliRTrczN9NSrJ9b+MX2MHfYhtsk40Bi74SVSfWLwz95rZAFgrvD9woF7fxmuOiKss5zFiFN
 pkXVJ6m9c5vOsEtd/Y+evGvXZDcrcoSJcNTRl5VG5e/0XpxLicfJK33lVnUpt/N27yms2n0AK
 ycmsE8TS8ywRGhzuHPgN+Q4qk6N5caXHHOD1MBaMqw==

#regzbot introduced: a19a93e4c6a98c9c0f2f5a6db76846f10d7d1f85

On 09.06.23 13:04, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> I'm running LibreELEC.tv on an x86_64 machine that, following a (kernel) update, now locks up hard while trying to device_resume() => device_lock() on sr 2:0:0:0 (the only sr device in the system).
>>
>> Through some digging of my own, I can pretty much isolate the fault in this device_lock() call:
>> https://elixir.bootlin.com/linux/v6.3.4/source/drivers/base/power/main.c#L919
>>
>> I put an additional debug line exactly before the device_lock(dev) call, like this:
>> dev_info(dev, "device_lock() in device_resume()");
>>
>> This is the last diagnostic I see, that device_lock() call never returns, ie line 920 in main.c is never reached (confirmed via TRACE_RESUME).
>> The device, in my case, is printed as sr 2:0:0:0.
>>
>> Knowing this, as a workaround, booting with libata.force=3:disable (libata port 3 corresponds to the SATA channel that sr 2:0:0:0 is attached to) allows suspend/resume to work correctly (but the optical drive is not accessible, obviously).
>>
>> When resume hangs, the kernel is not _completely_ locked, interestingly the machine responds to pings and I see the e1000e 'link up' message a couple seconds after the hanging sr2 device_lock().
>> Magic SysRq, however, does NOT work in that state; possibly because not enough of USB is resumed yet. Resuming devices seems to broadly follow a kind of breadth-first order; I see USB ports getting resumed closely before the lockup, but no USB (target) devices.
>>
>> This is a regression, earlier kernels would work correctly on the exact same hardware. Since it's an 'embedded' type (LibreELEC.tv) install that overwrites its system parts completely on each update, I don't have a clear historical record of kernel versions. From the timeline and my memory, moving from 5.x to 6.x would make sense. Due to the nature of the system, it's somewhat inconvenient for me to try numerous kernel versions blindly for a bisection; I will try to test against some current 5.x soon, however.
>>
>> I do have the hope that this information already might give someone with more background a strong idea about the issue.
>>
>> Next, I will try to put debug_show_all_locks() before device_lock(), since I can't Alt+SysRq+d.
> 
> See Bugzilla for the full thread.
> 
> Anyway, I'm adding it to regzbot (with rough version range since the reporter
> only knows major kernel version numbers):
> 
> #regzbot introduced: v5.0..v6.4-rc5 https://bugzilla.kernel.org/show_bug.cgi?id=217530
> #regzbot title: Waking up from resume locks up on SCSI CD/DVD drive
> 
> Thanks.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217530
> 

