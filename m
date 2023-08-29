Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DBC1116
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 12:08:10 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qaxVt-0005Gc-4Q; Tue, 29 Aug 2023 14:08:05 +0200
Message-ID: <6a39c016-0f00-6cfa-834e-abe5acb79757@leemhuis.info>
Date: Tue, 29 Aug 2023 14:08:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer
 dereference,address:00000004
Content-Language: en-US, de-DE
To: kkabe@vega.pgw.jp
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>
References: <230722113014.M0204460@vega.pgw.jp>
 <230723205506.M0106064@vega.pgw.jp>
 <20230723103210.4b1b032e@rorschach.local.home>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230723103210.4b1b032e@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693310890;cda544a1;
X-HE-SMSGID: 1qaxVt-0005Gc-4Q

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

I still have this issue on my list of tracked regressions.

Was this fixed in between? Doesn't look like it from here, but I might
be missing something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 23.07.23 16:32, Steven Rostedt wrote:
> On Sun, 23 Jul 2023 20:55:06 +0900
> <kkabe@vega.pgw.jp> wrote:
> 
>> So I tried to trap NULL and return:
>>
>> ================ patch-drm_vblank_cancel_pending_works-printk-NULL-ret.patch
>> diff -up ./drivers/gpu/drm/drm_vblank_work.c.pk2 ./drivers/gpu/drm/drm_vblank_work.c
>> --- ./drivers/gpu/drm/drm_vblank_work.c.pk2	2023-06-06 20:50:40.000000000 +0900
>> +++ ./drivers/gpu/drm/drm_vblank_work.c	2023-07-23 14:29:56.383093673 +0900
>> @@ -71,6 +71,10 @@ void drm_vblank_cancel_pending_works(str
>>  {
>>  	struct drm_vblank_work *work, *next;
>>  
>> +	if (!vblank->dev) {
>> +		printk(KERN_WARNING "%s: vblank->dev == NULL? returning\n", __func__);
>> +		return;
>> +	}
>>  	assert_spin_locked(&vblank->dev->event_lock);
>>  
>>  	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
>> ================
>>
>> This time, the printk trap does not happen!! and radeon.ko works.
>> (NULL check for vblank->worker is still fireing though)
>>
>> Now this is puzzling.
>> Is this a timing issue?
> 
> It could very well be. And the ftrace patch could possibly not be the
> cause at all. But the thread that is created to do the work is causing
> the race window to be opened up, which is why you see it with the patch
> and don't without it. It may not be the problem, it may just tickle the
> timings enough to trigger the bug, and is causing you to go on a wild
> goose chase in the wrong direction.
> 
> -- Steve
> 
> 
>> Is systemd-udevd doing something not favaorble to kernel?
>> Is drm vblank code running without enough initialization?
>>
>> Puzzling is, that purely useland activity
>> (logging in on tty1 before radeon.ko load)
>> is affecting kernel panic/no-panic.
> 
> 
> 
