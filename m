Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B10510E
	for <regressions@lists.linux.dev>; Fri, 18 Mar 2022 18:04:59 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nVGy9-0002dA-6A; Fri, 18 Mar 2022 19:04:57 +0100
Message-ID: <2ea77295-e8a1-d312-e142-2e238f081993@leemhuis.info>
Date: Fri, 18 Mar 2022 19:04:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Takashi Iwai <tiwai@suse.de>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Satadru Pramanik <satadru@gmail.com>, Steve French <smfrench@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Regression report for mainline, extra issue [2022-03-18]
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647626699;ca9cd4a6;
X-HE-SMSGID: 1nVGy9-0002dA-6A

Hi Linus! Just FYI, a couple of regression reports showed up in the
last few days and I thought you might wanted to known about them
a bit before releasing 5.17. Hence a quick manual regression
report focusing on regression from this cycle:


[ *NEW* ] HID: multitouch: right touchpad button is disabled on recent kernels
------------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/s5htubv32s8.wl-tiwai@suse.de/

https://lore.kernel.org/stable/s5htubv32s8.wl-tiwai@suse.de/



Introduced in 37ef4c19b4c6 (v5.17-rc5)



Noteworthy links:

* https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/726#note_=1303623

Patch is available and was tested successfully today, but looks
like José only wants to sent it out for review next week:
* https://lore.kernel.org/stable/20220318160518.GA2950@elementary/


[ *NEW* ] cifs: smb3: incorrect session setup check for multiuser mounts

------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/CAH2r5mth2fYLzU5+oN09ipT7peRdyAiPCF-7_fLPsTpA-fKKLA@mail.gmail.com/

https://lore.kernel.org/linux-cifs/CAH2r5mth2fYLzU5%2BoN09ipT7peRdyAiPCF-7_fLPsTpA-fKKLA@mail.gmail.com/

Introduced in 73f9bfbe3d81 (v5.17-rc1)

There are two patches to fix this, Steve might sent one to you
soon:
https://lore.kernel.org/linux-cifs/CANT5p=rkZMhzTd8n74%2BVh22qE11B_Mti5YEscGvpEf25Q39P_A@mail.gmail.com/


cifs: Failure to access cifs mount of samba share after resume from sleep

-------------------------------------------------------------------------

https://linux-regtracking.leemhuis.info/regzbot/regression/CAFrh3J9soC36+BVuwHB=g9z_KB5Og2+p2_W+BBoBOZveErz14w@mail.gmail.com/
https://lore.kernel.org/linux-cifs/CAFrh3J9soC36%2BBVuwHB=g9z_KB5Og2%2Bp2_W%2BBBoBOZveErz14w@mail.gmail.com/

Introduced in v5.16..v5.17-rc5

This was known for a while, but regzbot didn't sort it properly
into the "regressions from this cycle" category. Sorry about that.
Anyway:

No fix in sight (devs tried in the past few days) and reporter
has no way to test patches in the next few days:
https://lore.kernel.org/linux-cifs/CANT5p=rgz95=wDnZ_ANCaQQbZ1NpW2%2BSE2Dm2XoSk7-dCy0g=g@mail.gmail.com/


[ *NEW* ] "vmwgfx: probe of 0000:00:0f.0 failed with error -16" in guest

------------------------------------------------------------------------
https://linux-regtracking.leemhuis.info/regzbot/regression/08e3a9b1-5ed3-be89-1d48-5d1061253789@leemhuis.info/

https://lore.kernel.org/dri-devel/08e3a9b1-5ed3-be89-1d48-5d1061253789@leemhuis.info/

https://bugzilla.kernel.org/show_bug.cgi?id=215678

According to the bugzilla ticket it seems to be a regression from
this cycle. A fix is available here (included in -next since early
February :-/ ):
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=27599aacbaefcbf2af7b06b0029459bbf682000d

But according to the patch description its fixing a issue introduced
in 5.11. Not sure who's right.


MISC
----
FWIW, I just noticed there is a new regression report in bko
which I didn't look closer at yet; looks like it's a report
from a distro (Fedora) kernel, but I'd thought I nevertheless
briefly mention it:

Bug 215696 - Kernel Oops since kernel-5.17 on dual socket Intel
Xeon Gold servers - kernel NULL pointer dereference 
https://bugzilla.kernel.org/show_bug.cgi?id=215696

Ciao, Thorsten
