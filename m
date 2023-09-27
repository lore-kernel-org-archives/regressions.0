Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81114ABB
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 08:55:50 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qlQKi-0001vm-Al; Wed, 27 Sep 2023 10:55:48 +0200
Message-ID: <3efa338a-6d0c-46a9-ae59-d96fbe6aa5af@leemhuis.info>
Date: Wed, 27 Sep 2023 10:55:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: s2idle stopped working with 6.6-rc on Thinkpad T14 G1 (AMD)
Content-Language: en-US, de-DE
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <0d84fb59-4628-4c7f-ab1a-f58889ef2c9b@leemhuis.info>
 <e556ae63-0539-4b34-b33f-5f5beb4183d1@amd.com>
 <e049aa41-b136-4071-850f-d06b47fe67a1@leemhuis.info>
 <5f753ef4-caec-479a-bff4-43c16fb3317b@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <5f753ef4-caec-479a-bff4-43c16fb3317b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695804950;c9f8156f;
X-HE-SMSGID: 1qlQKi-0001vm-Al

On 25.09.23 19:44, Mario Limonciello wrote:
> On 9/25/2023 08:45, Thorsten Leemhuis wrote:
>> On 25.09.23 15:25, Mario Limonciello wrote:
>>> On 9/25/2023 05:55, Thorsten Leemhuis wrote:
>>>> Hi Mario! Did you by chance hear anything about lock-ups on resume with
>>>> mainline affecting AMD systems? I'm asking, as s2idle stopped working
>>>> for me with 6.6-rc on my Thinkpad T14 G1 (AMD).
>>> You're the first report I've heard of this.
>> Thx for taking the time and replying.
> [...]
> FWIW your email prompted me to double check the two other Lenovo systems
> I have on hand at my desk:
> * P14s Gen 1
> * L14 Gen2a
> 
> One of them had a Ubuntu userspace (20.04 IIRC) and the other a Fedora
> 38.  I built 6.6-rc3 and couldn't reproduce any issues with s2idle.
> 
> So yes; bisect is the next step, thanks.

Thx again for your work. Turns out it was


