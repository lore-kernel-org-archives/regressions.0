Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CB5692
	for <regressions@lists.linux.dev>; Thu, 15 Dec 2022 17:33:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p5s74-0007KV-Hd; Thu, 15 Dec 2022 18:33:42 +0100
Message-ID: <c1ff5cae-7f56-7fdb-c832-ffbcc177535b@leemhuis.info>
Date: Thu, 15 Dec 2022 18:33:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: regression: insmod module failed in VM with nvdimm on
Content-Language: en-US, de-DE
To: Ard Biesheuvel <ardb@kernel.org>,
 "chenxiang (M)" <chenxiang66@hisilicon.com>
Cc: Marc Zyngier <maz@kernel.org>, will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, chenxiang via <qemu-devel@nongnu.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
 <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
 <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
 <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
 <CAMj1kXGF=DuQSgf8FbW98WTX94U7rB0hq_cFAc0+AfVn=HHsFg@mail.gmail.com>
 <21cf7de2-27e8-8d1f-9efc-aa68cefbad50@hisilicon.com>
 <CAMj1kXFUso6CdDa3jMCrdHOBmOim0Z8YxB00a=kF5BbVxw9Xxw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAMj1kXFUso6CdDa3jMCrdHOBmOim0Z8YxB00a=kF5BbVxw9Xxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671125636;81a8718f;
X-HE-SMSGID: 1p5s74-0007KV-Hd

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Was there some progress to get this regression resolved? From here it
looks stalled, but maybe I missed something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

On 02.12.22 14:44, Ard Biesheuvel wrote:
> On Fri, 2 Dec 2022 at 03:48, chenxiang (M) <chenxiang66@hisilicon.com> wrote:
>>
>> Hi Ard,
>>
>>
>> 在 2022/12/1 19:07, Ard Biesheuvel 写道:
>>> On Thu, 1 Dec 2022 at 09:07, Ard Biesheuvel <ardb@kernel.org> wrote:
>>>> On Thu, 1 Dec 2022 at 08:15, chenxiang (M) <chenxiang66@hisilicon.com> wrote:
>>>>> Hi Ard,
>>>>>
>>>>>
>>>>> 在 2022/11/30 16:18, Ard Biesheuvel 写道:
>>>>>> On Wed, 30 Nov 2022 at 08:53, Marc Zyngier <maz@kernel.org> wrote:
>>>>>>> On Wed, 30 Nov 2022 02:52:35 +0000,
>>>>>>> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> We boot the VM using following commands (with nvdimm on)  (qemu
>>>>>>>> version 6.1.50, kernel 6.0-r4):
>>>>>>> How relevant is the presence of the nvdimm? Do you observe the failure
>>>>>>> without this?
>>>>>>>
>>>>>>>> qemu-system-aarch64 -machine
>>>>>>>> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
>>>>>>>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
>>>>>>>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
>>>>>>>> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
>>>>>>>> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
>>>>>>>> -object memory-backend-ram,id=ram1,size=10G -device
>>>>>>>> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
>>>>>>>> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
>>>>>>>>
>>>>>>>> Then in VM we insmod a module, vmalloc error occurs as follows (kernel
>>>>>>>> 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
>>>>>>>>
>>>>>>>> estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
>>>>>>>> [    8.186563] vmap allocation for size 20480 failed: use
>>>>>>>> vmalloc=<size> to increase size
>>>>>>> Have you tried increasing the vmalloc size to check that this is
>>>>>>> indeed the problem?
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
>>>>>>>> defer initialization to initcall where permitted").
>>>>>>> I guess you mean commit fc5a89f75d2a instead, right?
>>>>>>>
>>>>>>>> Do you have any idea about the issue?
>>>>>>> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
>>>>>>> portion of the vmalloc space, but you give very little information
>>>>>>> that could help here...
>>>>>>>
>>>>>> Ouch. I suspect what's going on here: that patch defers the
>>>>>> randomization of the module region, so that we can decouple it from
>>>>>> the very early init code.
>>>>>>
>>>>>> Obviously, it is happening too late now, and the randomized module
>>>>>> region is overlapping with a vmalloc region that is in use by the time
>>>>>> the randomization occurs.
>>>>>>
>>>>>> Does the below fix the issue?
>>>>> The issue still occurs, but it seems decrease the probability, before it
>>>>> occured almost every time, after the change, i tried 2-3 times, and it
>>>>> occurs.
>>>>> But i change back "subsys_initcall" to "core_initcall", and i test more
>>>>> than 20 times, and it is still ok.
>>>>>
>>>> Thank you for confirming. I will send out a patch today.
>>>>
>>> ...but before I do that, could you please check whether the change
>>> below fixes your issue as well?
>>>
>>> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
>>> index 6ccc7ef600e7c1e1..c8c205b630da1951 100644
>>> --- a/arch/arm64/kernel/kaslr.c
>>> +++ b/arch/arm64/kernel/kaslr.c
>>> @@ -20,7 +20,11 @@
>>>   #include <asm/sections.h>
>>>   #include <asm/setup.h>
>>>
>>> -u64 __ro_after_init module_alloc_base;
>>> +/*
>>> + * Set a reasonable default for module_alloc_base in case
>>> + * we end up running with module randomization disabled.
>>> + */
>>> +u64 __ro_after_init module_alloc_base = (u64)_etext - MODULES_VSIZE;
>>>   u16 __initdata memstart_offset_seed;
>>>
>>>   struct arm64_ftr_override kaslr_feature_override __initdata;
>>> @@ -30,12 +34,6 @@ static int __init kaslr_init(void)
>>>          u64 module_range;
>>>          u32 seed;
>>>
>>> -       /*
>>> -        * Set a reasonable default for module_alloc_base in case
>>> -        * we end up running with module randomization disabled.
>>> -        */
>>> -       module_alloc_base = (u64)_etext - MODULES_VSIZE;
>>> -
>>>          if (kaslr_feature_override.val & kaslr_feature_override.mask & 0xf) {
>>>                  pr_info("KASLR disabled on command line\n");
>>>                  return 0;
>>> .
>>
>> We have tested this change, the issue is still and it doesn't fix the issue.
>>
> 
> Thanks for the report.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

#regzbot poke
