Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C751854
	for <regressions@lists.linux.dev>; Sat, 15 Jul 2023 11:30:14 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qKdTT-0004Oy-5s; Sat, 15 Jul 2023 13:30:07 +0200
Message-ID: <8c18ee62-2647-92f1-6430-5af650f8bc11@leemhuis.info>
Date: Sat, 15 Jul 2023 13:30:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, de-DE
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
 <20230711-encore-hunchback-2d103b@meerkat>
 <10064cba-f0fe-fbc6-0c3a-97be48360a05@leemhuis.info>
 <20230714-zion-margin-natasha-a66ce1@meerkat>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Bugbot for all kernel bugs?
In-Reply-To: <20230714-zion-margin-natasha-a66ce1@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1689420614;53e2e161;
X-HE-SMSGID: 1qKdTT-0004Oy-5s

On 14.07.23 22:19, Konstantin Ryabitsev wrote:
> On Thu, Jul 13, 2023 at 01:45:58PM +0200, Thorsten Leemhuis wrote:
>>> So, we can't easily do "enable for all the bugs" because the bot was written
>>> with the idea that it would be invoked per-component. Is there a bugzilla
>>> component (and a matching mailing list) that you have in mind for the bot?
>>
>> Ugh. :-/ Well, as you can see from a quick search like
>> https://lore.kernel.org/all/?q=%28nq%3A%22noticed+a+regression+report+in+bugzilla.kernel.org%22+f%3Aleemhuis%29+OR+%28nq%3A%22I+notice+a+regression+report+on+Bugzilla%22+f%3Asanjaya%29
>> we have to deal will bug reports for many different components. So it
>> would be great if it could be enabled for all products/components, except:
>>
>> * all components from the product categories "Alternate Trees",
>> "Backports project", "Documentation", "kernel.org", and "Tools"
>>
>> * "Bug Tracker", "klibc/kinit", "module-init-tools", and "Spam" from the
>> product category "Other"
>>
>> There might be a few more that are obsolete hidden in the other products
>> categories (like "PS3" in "Platform Specific/Hardware" or "lguest" in
>> "Virtualization")
>>
>> Did I say "Ugh" already? Ohh, seems I did. :-/
>>
>> So how do you suggest to move forward
> 
> One of the main drives behind bugbot was to eliminate as many components as
> possible and just let people file bugs under "Linux/Kernel". The "bug
> wrangler" people would then do initial triage

So bugs that people file for products/components that will remain won't
get triage? Wondering if that is a wise idea, but whatever, that is
nothing I'd consider a blocker, so let see.

> and set the "Subsystem" field to
> match an entry from MAINTAINERS. Then, they would set the "bugbot" flag to "+"
> and let the bot do the rest, fully bridging bugzilla with the mailing lists.
> 
> So, in my perfect little world we'd:
> 
> 1. identify products/components that we can abandon right away and close them
>    for new bug entry
> 2. identify the "bug wranglers" who can do the initial triage and grant them
>    the power to set the "bugbot" flag
> 3. catch and fix the bugs
> 
> We can start with #1 if everyone is happy with this course of action.

Hmmm, that's fine with me, but all that will take some time, hence allow
me to ask: if there a downside (much work?) to simply enable it now for
lots of other products/components until 1 and 2 are realized?

Ciao, Thorsten
