Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A713FE3C
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r2uzv-0007D6-1O; Tue, 14 Nov 2023 16:06:39 +0100
Message-ID: <c6212bcb-e2d8-4bb8-bef9-0a0f29c8726e@leemhuis.info>
Date: Tue, 14 Nov 2023 16:06:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference regression when running `chmod -R
 root:tracing /sys/kernel/debug/tracing`
Content-Language: en-US, de-DE
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Milian Wolff <milian.wolff@kdab.com>, akaher@vmware.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, mhiramat@kernel.org
References: <20231105160139.660634360@goodmis.org>
 <20231112104158.6638-1-milian.wolff@kdab.com>
 <2053f011-3c85-41e2-8685-1f46a2bc5fb8@leemhuis.info>
 <20231114085529.77099439@rorschach.local.home>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20231114085529.77099439@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1699974405;46d13fb8;
X-HE-SMSGID: 1r2uzv-0007D6-1O



On 14.11.23 14:55, Steven Rostedt wrote:
> On Tue, 14 Nov 2023 14:38:57 +0100
> "Linux regression tracking #adding (Thorsten Leemhuis)" <regressions@leemhuis.info> wrote:
> 
>> [TLDR: I'm adding this report to the list of tracked Linux kernel
>> regressions; the text you find below is based on a few templates
>> paragraphs you might have encountered already in similar form.
>> See link in footer if these mails annoy you.]
>>
>> On 12.11.23 11:41, Milian Wolff wrote:
>>>
>>> this patch seems to have introduced a kernel bug causing
>>> a NULL pointer dereference when one runs:
>>>
>>>     sudo chown -R root:tracing /sys/kernel/debug/tracing/
>>>
>>> See the archlinux bug report I created initially for some more information:
>>> https://bugs.archlinux.org/task/80230
>>>
>>> With 6.6.1 and 9aaee3eebc91dd9ccebf6b6bc8a5f59d04ef718b reverted,
>>> the above `chmod` command works. With a normal 6.6.1 build, or re-applying
>>> the patch again, the command fails and `dmesg` shows:  
>>
>> Steven is already working on this, but to ensure the issue doesn't fall
>> through the cracks unnoticed, I'm adding it to regzbot, the Linux kernel
>> regression tracking bot (and from the context I assume it happens in
>> mainline as well)
> 
> Note, the code in question was rewritten in 6.7 and the bug does not
> exist there. It only exists in 6.6 and I already sent Greg the patch,
> and he told me that it's in his queue.
> 
> It's only a regression in 6.6 and not in mainline.

Ahh, sorry fot getting this wrong and thx for letting me know.

#regzbot introduced 9aaee3eebc91dd9ccebf6b6bc8a5f59d04ef718b
#regzbot fix: eventfs: Check for NULL ef in eventfs_set_attr()

Ciao, Thorsten

P.S.: Enjoy LPC, hope to be there again next year.
