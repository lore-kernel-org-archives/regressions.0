Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4C641
	for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 04:44:58 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pTF5j-0000sJ-En; Sat, 18 Feb 2023 05:44:55 +0100
Message-ID: <3ff87754-70f2-079c-d522-2330d0ffb5fd@leemhuis.info>
Date: Sat, 18 Feb 2023 05:44:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: 6.2-rc7 fails building on Talos II: memory.c:(.text+0x2e14):
 undefined reference to `hash__tlb_flush'
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "Erhard F." <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230216005535.6bff7aa6@yea>
 <e9923ff8-4027-9188-fd04-77d0bbbc6573@leemhuis.info>
In-Reply-To: <e9923ff8-4027-9188-fd04-77d0bbbc6573@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676695498;84afa4cb;
X-HE-SMSGID: 1pTF5j-0000sJ-En

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 16.02.23 11:09, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> On 16.02.23 00:55, Erhard F. wrote:
>> Just noticed a build failure on 6.2-rc7 for my Talos 2 (.config attached):
>>
>>  # make
>>   CALL    scripts/checksyscalls.sh
>>   UPD     include/generated/utsversion.h
>>   CC      init/version-timestamp.o
>>   LD      .tmp_vmlinux.kallsyms1
>> ld: ld: DWARF error: could not find abbrev number 6
>> mm/memory.o: in function `unmap_page_range':
>> memory.c:(.text+0x2e14): undefined reference to `hash__tlb_flush'
>> ld: memory.c:(.text+0x2f8c): undefined reference to `hash__tlb_flush'
>> ld: ld: DWARF error: could not find abbrev number 3117
>> mm/mmu_gather.o: in function `tlb_remove_table':
>> mmu_gather.c:(.text+0x584): undefined reference to `hash__tlb_flush'
>> ld: mmu_gather.c:(.text+0x6c4): undefined reference to `hash__tlb_flush'
>> ld: mm/mmu_gather.o: in function `tlb_flush_mmu':
>> mmu_gather.c:(.text+0x80c): undefined reference to `hash__tlb_flush'
>> ld: mm/mmu_gather.o:mmu_gather.c:(.text+0xbe0): more undefined references to `hash__tlb_flush' follow
>> make[1]: *** [scripts/Makefile.vmlinux:35: vmlinux] Fehler 1
>> make: *** [Makefile:1264: vmlinux] Error 2

#regzbot fix: 4302abc628fc0dc08e5855f21bbfa
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


