Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F60A40
	for <regressions@lists.linux.dev>; Wed, 28 Sep 2022 07:21:55 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1odROD-0004Rq-FL; Wed, 28 Sep 2022 09:21:53 +0200
Message-ID: <dae5e0a7-c806-eadb-6853-3a3b0652b4aa@leemhuis.info>
Date: Wed, 28 Sep 2022 09:21:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [sparc64] fails to boot, (was: Re: [PATCH memcg v6] net: set
 proper memcg for net_init hooks allocations) #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: kernel@openvz.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 cgroups@vger.kernel.org, sparclinux@vger.kernel.org
References: <6b362c6e-9c80-4344-9430-b831f9871a3c@openvz.org>
 <f9394752-e272-9bf9-645f-a18c56d1c4ec@openvz.org>
 <20220918092849.GA10314@u164.east.ru>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220918092849.GA10314@u164.east.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664349715;a338ba5b;
X-HE-SMSGID: 1odROD-0004Rq-FL

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 18.09.22 11:28, Anatoly Pugachev wrote:
> On Fri, Jun 03, 2022 at 07:19:43AM +0300, Vasily Averin wrote:
>> __register_pernet_operations() executes init hook of registered
>> pernet_operation structure in all existing net namespaces.
>>
>> Typically, these hooks are called by a process associated with
>> the specified net namespace, and all __GFP_ACCOUNT marked
>> allocation are accounted for corresponding container/memcg.
>>
>> However __register_pernet_operations() calls the hooks in the same
>> context, and as a result all marked allocations are accounted
>> to one memcg for all processed net namespaces.
>>
>> This patch adjusts active memcg for each net namespace and helps
>> to account memory allocated inside ops_init() into the proper memcg.
>>
>> Signed-off-by: Vasily Averin <vvs@openvz.org>
>> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
>> Acked-by: Shakeel Butt <shakeelb@google.com>
>> ---
>> v6: re-based to current upstream (v5.18-11267-gb00ed48bb0a7)
> 
> 
> Hello!
> 
> I'm unable to boot my sparc64 VM anymore (5.19 still boots, 6.0-rc1 does not),
> bisected up to this patch,
> 
> mator@ttip:~/linux-2.6$ git bisect bad
> 1d0403d20f6c281cb3d14c5f1db5317caeec48e9 is the first bad commit
> commit 1d0403d20f6c281cb3d14c5f1db5317caeec48e9
> Author: Vasily Averin <vvs@openvz.org>
> Date:   Fri Jun 3 07:19:43 2022 +0300

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 1d0403d20f6c281cb3d14c5f1db5317caeec48e9
#regzbot title cgroups/sparc64: sparc64 fails to boot
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.


Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
