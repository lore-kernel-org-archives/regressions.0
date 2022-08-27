Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C0415A9
	for <regressions@lists.linux.dev>; Sat, 27 Aug 2022 13:39:44 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oRw2C-0006C8-Jf; Sat, 27 Aug 2022 15:39:36 +0200
Message-ID: <e9cf6b9e-df35-ab3a-4e9f-d73e2757a870@leemhuis.info>
Date: Sat, 27 Aug 2022 15:39:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [Regression] Bug 216360 - No power to DVD drive
Content-Language: en-US
To: bhealey@live.co.uk
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
 <CAJZ5v0iaAOH9MF5YziW_AjxKjP1uAfRYWvDapgbTbsStUG-g0Q@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAJZ5v0iaAOH9MF5YziW_AjxKjP1uAfRYWvDapgbTbsStUG-g0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661607585;a16e7cf7;
X-HE-SMSGID: 1oRw2C-0006C8-Jf

On 27.08.22 13:54, Rafael J. Wysocki wrote:
> On Fri, Aug 26, 2022 at 12:13 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Hi Rafael. Could you help me out if you have a minute? I noticed
>> a regression report in bugzilla that nobody looked at yet. According to
>> the reporter the DVD drive's drawer of a small form factor system won't
>> open anymore since v5.16; the device is not even mentioned anymore in
>> the dmesg output. For details see:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=216360
>>
>> Is that an ACPI problem and thus something you would handle?
> I honestly don't think so.

Okay, already suspected that, thx.

>> If not: in which direction would you shove this?
> 
> See https://bugzilla.kernel.org/show_bug.cgi?id=216360#c6
> 
> This issue is not reported against the mainline kernel, so it should
> be handled by whoever provided the kernel the reporter is using.

Well, you for sure have a point. But well, from what I can tell the
Manjaro kernel is not heavily patched (see
https://gitlab.manjaro.org/packages/core/linux519; but the RT in the
kernel's name makes me suspicious). And from my experience quite a few
developer seem to be interested in regression reports from such kernels.
That's why I (for now) pick some of them up (I use my best judgement
here) and let the developers decide what to do with them.

In this case I just don't really know whom to ask to look into this. :-/

Anyway, Bruce, things really look a bit odd in this case. You should try
to seek help from Manjaro -- or check if it really happens with a
vanilla kernel(¹). If you do the latter, ideally consider to use "git
bisect" to find the change that is causing the different behavior. Then
we know for sure who needs to look into this.

See also:

https://docs.kernel.org/admin-guide/reporting-issues.html
https://docs.kernel.org/admin-guide/reporting-regressions.html

Ciao, Thorsten

(¹) e.g. try a vanilla 5.15 kernel to see if your DVD works; use the
config from the Manjaro 5.15 kernel (consider running "make
localmodconfig" to reduce build times). Then compile a 5.16 vanilla
kernel with the config from your 5.15 kernel processed by 'make
olddefconfig'
