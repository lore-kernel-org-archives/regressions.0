Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F81FB3
	for <regressions@lists.linux.dev>; Fri,  3 Mar 2023 09:42:48 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pY1w3-0007DD-9B; Fri, 03 Mar 2023 10:42:43 +0100
Message-ID: <632d4ca3-01ed-4d51-41b0-40c1aa82ffe9@leemhuis.info>
Date: Fri, 3 Mar 2023 10:42:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: regression: insmod module failed in VM with nvdimm on #forregzbot
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 chenxiang via <qemu-devel@nongnu.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <b4b81dfd-d30c-e8f4-3ea3-1af9140a82bb@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <b4b81dfd-d30c-e8f4-3ea3-1af9140a82bb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677836568;39d3567f;
X-HE-SMSGID: 1pY1w3-0007DD-9B

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 30.11.22 11:10, Thorsten Leemhuis wrote:
>
> On 30.11.22 03:52, chenxiang (M) wrote:
>>
>> We boot the VM using following commands (with nvdimm on)  (qemu version
>> 6.1.50, kernel 6.0-r4):
>>
>> qemu-system-aarch64 -machine
>> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
>> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
>> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
>> -object memory-backend-ram,id=ram1,size=10G -device
>> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
>> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
>> [...]
>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
>> defer initialization to initcall where permitted").
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced fc5a89f75d2a
> #regzbot title arm64: kaslr: vmalloc error when boothing a VM with nvdimm
> #regzbot ignore-activity

#regzbot fix: arm64: kaslr: don't pretend KASLR is enabled if offset <
MIN_KIMG_ALIGN
#regzbot ignore-activity

Backstory:

https://lore.kernel.org/lkml/CAMj1kXGWEaQXoKj=DzG9XpVGi4t5zfE-RSG0BodVL-b47nsj-A@mail.gmail.com/
https://lore.kernel.org/all/20230223204101.1500373-1-ardb@kernel.org/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
