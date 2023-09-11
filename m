Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420E2F28
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 08:50:06 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qfccN-0004oo-TO; Mon, 11 Sep 2023 10:50:04 +0200
Message-ID: <4819de40-7eba-4ed4-a210-c5bb2f9c2378@leemhuis.info>
Date: Mon, 11 Sep 2023 10:50:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: power button stopped working on lenovo ideapad 5 since
 a855724dc08b
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <7b78505a-a8c9-4770-b283-807581b5edfb@leemhuis.info>
 <472fc5a1-46cb-66e0-463a-934806595997@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <472fc5a1-46cb-66e0-463a-934806595997@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694422206;9e5db2f8;
X-HE-SMSGID: 1qfccN-0004oo-TO

On 11.09.23 10:44, Hans de Goede wrote:
> On 9/11/23 09:50, Thorsten Leemhuis wrote:
>> [TLDR: Just adding a regression reported to bko to the tracking]
>>
>> Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
>> regression reported in bugzilla.kernel.org that seems to be handled
>> there already, nevertheless I'd like to add to the tracking to ensure
>> it's doesn't fall through the cracks in the end:
>>
>> #regzbot introduced: a855724dc08b
>> https://bugzilla.kernel.org/show_bug.cgi?id=217833
>> #regzbot title: power button stopped working on lenovo ideapad 5
>> #regzbot dup-of:
>> https://lore.kernel.org/stable/aa1649b6-b7a8-4fbe-8356-2c856951e283@gmail.com/
>> #regzbot ignore-activity
>>
>> See the ticket for details, there were a few replies already.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> Note there is a patch-series which fixes this (and which is planned
> to be reworked to fix it slightly different) pending here:
> 
> #regzbot link: https://lore.kernel.org/regressions/20230829165627.156542-1-mario.limonciello@amd.com/

thx, yeah, I had noticed it, but forgot to tell regzbot about it after I
noticed discussions for now moved to bugzilla. Thx for taking care of this!

Ciao, Thorsten
