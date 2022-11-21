Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F07F5
	for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 08:36:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ox2Hc-0007DG-GH; Mon, 21 Nov 2022 09:36:04 +0100
Message-ID: <c993c91a-a839-3072-2339-d2613ef548f8@leemhuis.info>
Date: Mon, 21 Nov 2022 09:36:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] x86/fpu: Allow PKRU to be (once again) written by ptrace.
 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20220731050342.56513-1-khuey@kylehuey.com>
 <1197176f-3508-0405-fad8-3645c81f474e@leemhuis.info>
In-Reply-To: <1197176f-3508-0405-fad8-3645c81f474e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669019766;9fe28f17;
X-HE-SMSGID: 1ox2Hc-0007DG-GH

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 09.11.22 11:23, Thorsten Leemhuis wrote:

> On 31.07.22 07:03, Kyle Huey wrote:
>> From: Kyle Huey <me@kylehuey.com>
>>
>> When management of the PKRU register was moved away from XSTATE, emulation
>> of PKRU's existence in XSTATE was added for APIs that read XSTATE, but not
>> for APIs that write XSTATE. This can be seen by running gdb and executing
>> `p $pkru`, `set $pkru = 42`, and `p $pkru`. On affected kernels (5.14+) the
>> write to the PKRU register (which gdb performs through ptrace) is ignored.
> 
> Seem I missed this one, but apparently it needs tracking.
> 
> #regzbot ^introduced e84ba47e313dbc
> #regzbot title x86/fpu: emulation of PKRU's existence in XSTATE missing
> for APIs that write XSTATE
> #regzbot ignore-activity
> #regzbot monitor
> https://lore.kernel.org/all/20221107063807.81774-1-khuey@kylehuey.com/

#regzbot fixed-by: 4a804c4f83
