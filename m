Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261D35E527;
	Fri, 23 Jan 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161657; cv=none; b=p/w3vU4GgP3+x+zK6yN5FHKIBM8ASxOkjlwTVJnPb8FE5DLADsZKGLWJoxPvlfGyXLwDTFQWjEGXnkVG2Kqa7IaM8s3AaM2RRcTe++F6wZX6tnKO6ZtuEMqcmEcqc7KaCbiCnJLzjlV2MEazA3rC4YT3Se6KXdlAEtI5t7f/9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161657; c=relaxed/simple;
	bh=quYFvRvfs/EuPFVndPb88Uiw4iKe4pJFxtd/jAc4IYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ2KMCluROFK6REjhPU8Igq1UKFqYywxNC9J58/8ZDkLP5TG1dBqjKvgqootbYNJFV5KLS1TKEXDK9lsz6C0PQpLiRDY/RlKWKKh5uvrYF6b4qTLagew3m66j5dyKaooa6RcdQBmy0hpcYnLSxuROvIzevMpQ5M7S2C7Yg/Xq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=sKnT7lDA; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="sKnT7lDA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=mTPcw+KtBxCUmdcvCGprm0enwKecfAgIbVlvMH0IZRU=; t=1769161652;
	x=1769593652; b=sKnT7lDAlOrJi1JkgQ5dB+dzCMLNg42kNx1n019/n+jRwUxs1D9CrhmVLrxxr
	K/9vVH5DvY3G+RvIq/RrTujCtv3vQAcfJkq6dctRkFRLycA7XJRbfuDSVA4FkjUS4Ls9SHHYlhrQQ
	Qep8FiYbBHAi5N/rD6J2Jqe28rV8S75s90Y3Nhmh5XbZqMsaZXUkx9u1Gqfed385nz94xRGWHmOiV
	ei2xgZuU4Q8CxBxsHPWpr7GUXbuiK6qK+WV4uCq27HaoLcBIh36xVMRpm1r3Jajege3gzkgYT30cv
	5ea+gj7lx7K/olzb+m1JaHmMwwp7X+olmgY6AHxFSQfMEBnwfA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vjDl9-005BpG-1q;
	Fri, 23 Jan 2026 10:47:19 +0100
Message-ID: <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
Date: Fri, 23 Jan 2026 10:47:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1769161652;e4e3f318;
X-HE-SMSGID: 1vjDl9-005BpG-1q

[CCing the regression list]

On 1/22/26 11:00, Alexey Makhalov wrote:
> 
> Thanks for reporting the problem.
> [...] 
> Workarounding QEMU misbehavior from the kernel side by introducing less
> efficient asm inlines does not sound correct.

Well, fixing bugs right where they are obviously is a good thing.

But well, the problem according to the description quoted below was
exposed by a change that went into 6.19-rc1 -- which makes it a kernel
regression that must be fixed in the kernel (ideally before 6.19 is out).

At least from my understanding of Linus point of view on situations like
that. Or am I mistaken for some reason?

Or is this a case of "we for now assume this is such a corner case that
nobody else will hit; if we are wrong we'll reconsider".

Ciao, Thorsten

> Please report or fix the issue from QEMU side.
> Recommended QEMU fix: vmmouse_get_data/vmmouse_set_data should save/
> restore target_ulong type instead of uint32_t.
> 
> Regards,
> --Alexey
> 
> On 1/21/26 7:18 PM, Josh Poimboeuf wrote:
>> Fedora QA reported the following panic:
>>
>>    BUG: unable to handle page fault for address: 0000000040003e54
>>    #PF: supervisor write access in kernel mode
>>    #PF: error_code(0x0002) - not-present page
>>    PGD 1082ec067 P4D 0
>>    Oops: Oops: 0002 [#1] SMP NOPTI
>>    CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
>> 6.19.0-0.rc4.260108gf0b9d8eb98df.34.fc43.x86_64 #1 PREEMPT(lazy)
>>    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
>> edk2-20251119-3.fc43 11/19/2025
>>    RIP: 0010:vmware_hypercall4.constprop.0+0x52/0x90
>>    Code: 48 83 c4 20 5b e9 69 f0 fc fe 8b 05 a0 c1 b2 01 85 c0 74 23
>> b8 68 58 4d 56 b9 27 00 00 00 31 d2 bb 04 00 00 00 66 ba 58 56 ed <89>
>> 1f 89 0e 41 89 10 5b e9 3c f0 fc fe 6a 00 49 89 f9 45 31 c0 31
>>    RSP: 0018:ff5eeb3240003e40 EFLAGS: 00010046
>>    RAX: 0000000000000000 RBX: 000000000000ffca RCX: 000000000000ffac
>>    RDX: 0000000000000000 RSI: 0000000040003e58 RDI: 0000000040003e54
>>    RBP: ff1e05f3c1204800 R08: ff5eeb3240003e5c R09: 000000009d899c41
>>    R10: 000000000000003d R11: ff5eeb3240003ff8 R12: 0000000000000000
>>    R13: 00000000000000ff R14: ff1e05f3c02f9e00 R15: 000000000000000c
>>    FS:  0000000000000000(0000) GS:ff1e05f489e40000(0000)
>> knlGS:0000000000000000
>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>    CR2: 0000000040003e54 CR3: 000000010841d002 CR4: 0000000000771ef0
>>    PKRU: 55555554
>>    Call Trace:
>>     <IRQ>
>>     vmmouse_report_events+0x13e/0x1b0
>>     psmouse_handle_byte+0x15/0x60
>>     ps2_interrupt+0x8a/0xd0
>>     ...
>>
>> The panic was triggered by dereferencing a bad pointer (in RDI)
>> immediately after a VMware hypercall:
>>
>>    ffffffff82135070 <vmware_hypercall4.constprop.0>:
>>    ...
>>    ffffffff821350ac:       b8 68 58 4d 56          mov    $0x564d5868,
>> %eax
>>    ffffffff821350b1:       b9 27 00 00 00          mov    $0x27,%ecx
>>    ffffffff821350b6:       31 d2                   xor    %edx,%edx
>>    ffffffff821350b8:       bb 04 00 00 00          mov    $0x4,%ebx
>>    ffffffff821350bd:       66 ba 58 56             mov    $0x5658,%dx
>>    ffffffff821350c1:       ed                      in     (%dx),
>> %eax    <-- hypercall
>>    ffffffff821350c2:       89 1f                   mov    %ebx,
>> (%rdi)    <-- crash
>>
>> Reading the disassembly shows that RDI should contain the value of a
>> valid kernel stack address here (0xff5eeb3240003e54).  Instead it
>> contains 0x40003e54, suggesting the hypervisor cleared the upper 32
>> bits.
>>
>> This issue was bisected to commit aca282ab7e75 ("x86/asm: Annotate
>> special section entries"), which added annotations to the ALTERNATIVE()
>> macro.  Despite the use of asm_inline, that commit caused the compiler
>> to un-inline and const-propagate vmware_hypercall4().
>>
>> That made RDI live across the hypercall, making the hypervisor's
>> register clobbering visible and exposing this latent bug.
>>
>> The open-vm-tools reference implementation treats all six registers as
>> clobbered for all hypercalls.  Match that behavior here.
>>
>> Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
>> Fixes: aca282ab7e75 ("x86/asm: Annotate special section entries")
>> Reported-by: Justin Forbes <jforbes@fedoraproject.org>
>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>> ---
>>   arch/x86/include/asm/vmware.h | 72 +++++++++++++++++------------------
>>   1 file changed, 34 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/
>> vmware.h
>> index c9cf43d5ef23..372173d4ea27 100644
>> --- a/arch/x86/include/asm/vmware.h
>> +++ b/arch/x86/include/asm/vmware.h
>> @@ -98,7 +98,7 @@ extern unsigned long vmware_tdx_hypercall(unsigned
>> long cmd,
>>   static inline
>>   unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
>>   {
>> -    unsigned long out0;
>> +    unsigned long out0, tmp = 0;
>>         if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
>>           return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
>> @@ -109,13 +109,11 @@ unsigned long vmware_hypercall1(unsigned long
>> cmd, unsigned long in1)
>>                            NULL, NULL, NULL, NULL, NULL);
>>         asm_inline volatile (VMWARE_HYPERCALL
>> -        : "=a" (out0)
>> +        : "=a" (out0), "+b" (in1), "+c" (cmd), "+d" (tmp)
>>           : [port] "i" (VMWARE_HYPERVISOR_PORT),
>> -          "a" (VMWARE_HYPERVISOR_MAGIC),
>> -          "b" (in1),
>> -          "c" (cmd),
>> -          "d" (0)
>> -        : "cc", "memory");
>> +          "a" (VMWARE_HYPERVISOR_MAGIC)
>> +        : "di", "si", "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -123,7 +121,7 @@ static inline
>>   unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
>>                   u32 *out1, u32 *out2)
>>   {
>> -    unsigned long out0;
>> +    unsigned long out0, tmp = 0;
>>         if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
>>           return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
>> @@ -134,13 +132,13 @@ unsigned long vmware_hypercall3(unsigned long
>> cmd, unsigned long in1,
>>                            out1, out2, NULL, NULL, NULL);
>>         asm_inline volatile (VMWARE_HYPERCALL
>> -        : "=a" (out0), "=b" (*out1), "=c" (*out2)
>> +        : "=a" (out0), "=b" (*out1), "=c" (*out2), "+d" (tmp)
>>           : [port] "i" (VMWARE_HYPERVISOR_PORT),
>>             "a" (VMWARE_HYPERVISOR_MAGIC),
>>             "b" (in1),
>> -          "c" (cmd),
>> -          "d" (0)
>> -        : "cc", "memory");
>> +          "c" (cmd)
>> +        : "di", "si", "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -165,7 +163,8 @@ unsigned long vmware_hypercall4(unsigned long
>> cmd, unsigned long in1,
>>             "b" (in1),
>>             "c" (cmd),
>>             "d" (0)
>> -        : "cc", "memory");
>> +        : "di", "si", "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -185,15 +184,13 @@ unsigned long vmware_hypercall5(unsigned long
>> cmd, unsigned long in1,
>>                            NULL, out2, NULL, NULL, NULL);
>>         asm_inline volatile (VMWARE_HYPERCALL
>> -        : "=a" (out0), "=c" (*out2)
>> +        : "=a" (out0), "+b" (in1), "=c" (*out2), "+d" (in3),
>> +          "+S" (in4), "+D" (in5)
>>           : [port] "i" (VMWARE_HYPERVISOR_PORT),
>>             "a" (VMWARE_HYPERVISOR_MAGIC),
>> -          "b" (in1),
>> -          "c" (cmd),
>> -          "d" (in3),
>> -          "S" (in4),
>> -          "D" (in5)
>> +          "c" (cmd)
>>           : "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -213,14 +210,14 @@ unsigned long vmware_hypercall6(unsigned long
>> cmd, unsigned long in1,
>>                            NULL, out2, out3, out4, out5);
>>         asm_inline volatile (VMWARE_HYPERCALL
>> -        : "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
>> -          "=D" (*out5)
>> +        : "=a" (out0), "+b" (in1), "=c" (*out2), "=d" (*out3),
>> +          "=S" (*out4), "=D" (*out5)
>>           : [port] "i" (VMWARE_HYPERVISOR_PORT),
>>             "a" (VMWARE_HYPERVISOR_MAGIC),
>> -          "b" (in1),
>>             "c" (cmd),
>>             "d" (in3)
>>           : "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -241,15 +238,15 @@ unsigned long vmware_hypercall7(unsigned long
>> cmd, unsigned long in1,
>>                            out1, out2, out3, NULL, NULL);
>>         asm_inline volatile (VMWARE_HYPERCALL
>> -        : "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
>> +        : "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3),
>> +          "+S" (in4), "+D" (in5)
>>           : [port] "i" (VMWARE_HYPERVISOR_PORT),
>>             "a" (VMWARE_HYPERVISOR_MAGIC),
>>             "b" (in1),
>>             "c" (cmd),
>> -          "d" (in3),
>> -          "S" (in4),
>> -          "D" (in5)
>> +          "d" (in3)
>>           : "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -272,7 +269,9 @@ unsigned long vmware_hypercall_hb_out(unsigned
>> long cmd, unsigned long in2,
>>                         unsigned long in5, unsigned long in6,
>>                         u32 *out1)
>>   {
>> -    unsigned long out0;
>> +    unsigned long out0, port;
>> +
>> +    port = in3 | VMWARE_HYPERVISOR_PORT_HB;
>>         asm_inline volatile (
>>           UNWIND_HINT_SAVE
>> @@ -282,15 +281,13 @@ unsigned long vmware_hypercall_hb_out(unsigned
>> long cmd, unsigned long in2,
>>           "rep outsb\n\t"
>>           "pop %%" _ASM_BP "\n\t"
>>           UNWIND_HINT_RESTORE
>> -        : "=a" (out0), "=b" (*out1)
>> +        : "=a" (out0), "=b" (*out1), "+c" (in2), "+d" (port),
>> +          "+S" (in4), "+D" (in5)
>>           : "a" (VMWARE_HYPERVISOR_MAGIC),
>>             "b" (cmd),
>> -          "c" (in2),
>> -          "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
>> -          "S" (in4),
>> -          "D" (in5),
>>             [in6] VMW_BP_CONSTRAINT (in6)
>>           : "cc", "memory");
>> +
>>       return out0;
>>   }
>>   @@ -300,7 +297,9 @@ unsigned long vmware_hypercall_hb_in(unsigned
>> long cmd, unsigned long in2,
>>                        unsigned long in5, unsigned long in6,
>>                        u32 *out1)
>>   {
>> -    unsigned long out0;
>> +    unsigned long out0, port;
>> +
>> +    port = in3 | VMWARE_HYPERVISOR_PORT_HB;
>>         asm_inline volatile (
>>           UNWIND_HINT_SAVE
>> @@ -310,13 +309,10 @@ unsigned long vmware_hypercall_hb_in(unsigned
>> long cmd, unsigned long in2,
>>           "rep insb\n\t"
>>           "pop %%" _ASM_BP "\n\t"
>>           UNWIND_HINT_RESTORE
>> -        : "=a" (out0), "=b" (*out1)
>> +        : "=a" (out0), "=b" (*out1), "+c" (in2), "+d" (port),
>> +          "+S" (in4), "+D" (in5)
>>           : "a" (VMWARE_HYPERVISOR_MAGIC),
>>             "b" (cmd),
>> -          "c" (in2),
>> -          "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
>> -          "S" (in4),
>> -          "D" (in5),
>>             [in6] VMW_BP_CONSTRAINT (in6)
>>           : "cc", "memory");
>>       return out0;
> 

