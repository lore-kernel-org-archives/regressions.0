Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840E7DDAC
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 10:45:59 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qIoOz-0002Nq-Lb; Mon, 10 Jul 2023 12:45:57 +0200
Message-ID: <ad9a9126-1055-76cf-77e8-1408d5a3cc19@leemhuis.info>
Date: Mon, 10 Jul 2023 12:45:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
 <90150fe2-e07d-d991-5bab-0a931abda9a3@leemhuis.info>
In-Reply-To: <90150fe2-e07d-d991-5bab-0a931abda9a3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688985959;cfd4e357;
X-HE-SMSGID: 1qIoOz-0002Nq-Lb

On 29.06.23 19:06, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> On 29.06.23 16:40, Jiri Slaby wrote:
>>
>> On 27. 02. 23, 18:36, Suren Baghdasaryan wrote:
>>> Attempt VMA lock-based page fault handling first, and fall back to the
>>> existing mmap_lock-based handling if that fails.
>> [...]
>>> +    fault = handle_mm_fault(vma, address, flags |
>>> FAULT_FLAG_VMA_LOCK, regs);
>>> +    vma_end_read(vma);
>>> +
>>> +    if (!(fault & VM_FAULT_RETRY)) {
>>> +        count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>> +        goto done;
>>> +    }
>>> +    count_vm_vma_lock_event(VMA_LOCK_RETRY);
>>
>> This is apparently not strong enough as it causes go build failures like:
>> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 0bff0aaea03e2a3ed6bfa3021
> https://bugzilla.suse.com/show_bug.cgi?id=1212775
> #regzbot title mm: failures when building go in 1-3 out of 20 builds
> #regzbot ignore-activity

#regzbot fix: fb49c455323ff8319a1
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


