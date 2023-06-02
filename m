Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CED107B1
	for <regressions@lists.linux.dev>; Fri,  2 Jun 2023 11:38:46 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q5373-0008Tr-84; Fri, 02 Jun 2023 13:38:33 +0200
Message-ID: <6084703a-aaba-4069-0d11-48782d016bdd@leemhuis.info>
Date: Fri, 2 Jun 2023 13:38:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: nicolas.dichtel@6wind.com, Mike Christie <michael.christie@oracle.com>,
 hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com, mst@redhat.com,
 sgarzare@redhat.com, virtualization@lists.linux-foundation.org,
 brauner@kernel.org, ebiederm@xmission.com, torvalds@linux-foundation.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230202232517.8695-1-michael.christie@oracle.com>
 <20230202232517.8695-9-michael.christie@oracle.com>
 <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <17726d05-91bb-55da-e2f9-a9ba5b8d2223@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <17726d05-91bb-55da-e2f9-a9ba5b8d2223@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685705926;cd1bfe09;
X-HE-SMSGID: 1q5373-0008Tr-84

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 16.05.23 16:06, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 05.05.23 15:40, Nicolas Dichtel wrote:
>> Le 03/02/2023 à 00:25, Mike Christie a écrit :
>>> For vhost workers we use the kthread API which inherit's its values from
>>> and checks against the kthreadd thread. This results in the wrong RLIMITs
>>> being checked, so while tools like libvirt try to control the number of
>>> threads based on the nproc rlimit setting we can end up creating more
>>> threads than the user wanted.
>>
>> I have a question about (a side effect of?) this patch. The output of the 'ps'
>> command has changed. Here is an example:
>> [...]
> 
> Thanks for the report. This is already dealt with, but to be sure the
> issue doesn't fall through the cracks unnoticed, I'm adding it to
> regzbot, the Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 6e890c5d502

#regzbot fix: f9010dbdce911ee1f1af1398a24b1f9f992e0080
#regzbot ignore-activity

BTW, if anyone cares: just checked, it fixes my suspend problem. Thx
everyone!

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
