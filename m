Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409CA42
	for <regressions@lists.linux.dev>; Wed, 30 Nov 2022 10:11:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p0K3G-0001Ct-Kj; Wed, 30 Nov 2022 11:10:50 +0100
Message-ID: <b4b81dfd-d30c-e8f4-3ea3-1af9140a82bb@leemhuis.info>
Date: Wed, 30 Nov 2022 11:10:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: regression: insmod module failed in VM with nvdimm on #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 chenxiang via <qemu-devel@nongnu.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669803060;b7b6e920;
X-HE-SMSGID: 1p0K3G-0001Ct-Kj

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 30.11.22 03:52, chenxiang (M) wrote:
>
> We boot the VM using following commands (with nvdimm on)  (qemu version
> 6.1.50, kernel 6.0-r4):
> 
> qemu-system-aarch64 -machine
> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
> -object memory-backend-ram,id=ram1,size=10G -device
> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
> [...]
> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
> defer initialization to initcall where permitted").

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced fc5a89f75d2a
#regzbot title arm64: kaslr: vmalloc error when boothing a VM with nvdimm
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
