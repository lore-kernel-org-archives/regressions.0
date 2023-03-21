Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA2946F
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 14:28:52 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pecPB-0001NE-HP; Tue, 21 Mar 2023 14:52:01 +0100
Message-ID: <a79ea7f5-6a41-a6c9-cfec-ba01aa2a3cfa@leemhuis.info>
Date: Tue, 21 Mar 2023 14:52:00 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: [regression] Bug 217218 - Trying to boot Linux version 6-2.2 kernel
 with Marvell SATA controller 88SE9235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679408932;e1e1b63a;
X-HE-SMSGID: 1pecPB-0001NE-HP

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developers don't keep an eye on it, I decided to forward it by
mail (note, the reporter *is not* CCed to this mail, see[1]).

Christoph, apparently it's caused by a commit of yours.

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217218 :

>  jason_a69 2023-03-20 11:05:54 UTC
> 
> The machine will not boot as the controller appears to be lock up, reset
> itself and then only 2 of the 4 disks are detected which are connected
> to the controller.
> 
> The man errors I am getting are
> 
> dmar_fault 8 callbacks suppressed
> DMAR : DRHD: handling fault status req 2
> DMAR : [DMA Write NO_PASID] Request device [07.00.1] fault addr
> 0xfffe0000 [fault reason 0x82] Present bit in contect entry is clear
> 
> Kernel version 5.15.91 works fine, I also tried 6-0.0 which also failed
> 
> Looking in the change log for 6.0
> https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.0
> 
> There are quite a few iommu changes. As a result I changed
> /etc/default/grub from
> 
> GRUB_CMDLINE_LINUX="iommu=soft intel_iommu=on"
> 
> to
> 
> GRUB_CMDLINE_LINUX="iommu=soft intel_iommu=on iommu.forcedac=1"
> 
> which did not help.
> 
> If I do lspci on a kernel that boots I get 
> 
> 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor DRAM Controller (rev 09)
> 00:02.0 VGA compatible controller: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor Graphics Controller (rev 09)
> 00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
> 00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)
> 00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 05)
> 00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b5)
> 00:1c.2 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 3 (rev b5)
> 00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 (rev b5)
> 00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 5 (rev b5)
> 00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 05)
> 00:1f.0 ISA bridge: Intel Corporation H61 Express Chipset LPC Controller (rev 05)
> 00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Desktop SATA AHCI Controller (rev 05)
> 00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 05)
> 02:00.0 USB controller: Etron Technology, Inc. EJ188/EJ198 USB 3.0 Host Controller
> 03:00.0 PCI bridge: PLX Technology, Inc. PEX 8603 3-lane, 3-Port PCI Express Gen 2 (5.0 GT/s) Switch (rev ab)
> 04:01.0 PCI bridge: PLX Technology, Inc. PEX 8603 3-lane, 3-Port PCI Express Gen 2 (5.0 GT/s) Switch (rev ab)
> 04:02.0 PCI bridge: PLX Technology, Inc. PEX 8603 3-lane, 3-Port PCI Express Gen 2 (5.0 GT/s) Switch (rev ab)
> 05:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Connection (rev 03)
> 06:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Connection (rev 03)
> 07:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9235 PCIe 2.0 x2 4-port SATA 6 Gb/s Controller (rev 10)
> 
> I have had a look at the kernel parameters which are here
> 
> https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html?highlight=iommu
> 
> I have tried a few different parameters, the only thing that did work was
> intel_iommu=off
> 
> Using that option would mess up my VMs so I would rather not do that.
> 
> I am sure I am just missing a kernel parameter.
>
> [...]
>
> git bisect bad 78013eaadf696d2105982abb4018fbae394ca08f
> # first bad commit: [78013eaadf696d2105982abb4018fbae394ca08f] x86: remove the IOMMU table infrastructure

See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 78013eaadf696d21
https://bugzilla.kernel.org/show_bug.cgi?id=217218
#regzbot title: dma/x86: machine with Marvell SATA controller 88SE9235
stopped booting
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"
