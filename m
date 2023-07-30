Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45ED3D9F
	for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 16:14:02 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qQ93P-0001KP-KR; Sun, 30 Jul 2023 18:13:59 +0200
Message-ID: <88318723-afa1-965f-3dad-a66ab179e1fa@leemhuis.info>
Date: Sun, 30 Jul 2023 18:13:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
 <03985866-102a-2a58-cd54-f8db3bedfebc@leemhuis.info>
In-Reply-To: <03985866-102a-2a58-cd54-f8db3bedfebc@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690733642;9678e473;
X-HE-SMSGID: 1qQ93P-0001KP-KR

On 19.07.23 18:19, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 17.07.23 16:45, Sachin Sant wrote:
>> Kdump seems to be broken with 6.5 for ppc64le.
>> [...]
>>
>> 6.4 was good. Git bisect points to following patch
>>
>> commit 606787fed7268feb256957872586370b56af697a
>>     powerpc/64s: Remove support for ELFv1 little endian userspace
>>
>> Reverting this patch allows a successful capture of vmcore.

Was fixed by revert:

#regzbot fix: 106ea7ffd56
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
