Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2504417
	for <regressions@lists.linux.dev>; Tue,  4 Jul 2023 12:31:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qGfC7-00030A-Kc; Tue, 04 Jul 2023 14:31:47 +0200
Message-ID: <9727f43c-609f-fa6d-476b-282205a87bb2@leemhuis.info>
Date: Tue, 4 Jul 2023 14:31:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Ask for a regression issue of vfio-pci driver with Intel DG2
 (A770) discrete graphics card from Linux 6.1
Content-Language: en-US, de-DE
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 mika.westerberg@linux.intel.com, helgaas@kernel.org, bhelgaas@google.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <c836bf88-d961-040d-b15e-52feb8e11f8d@intel.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <c836bf88-d961-040d-b15e-52feb8e11f8d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688473916;01e2e886;
X-HE-SMSGID: 1qGfC7-00030A-Kc

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 03.07.23 12:37, Gwan-gyeong Mun wrote:
> 
> Since Linux 6.2 kernel (same happens in Linux 6.4.1), loading vfio-pci
> driver to a specific HW (Intel DG2 A770) target does not work properly.
> (It works fine on Linux 6.1 kernel with the same HW).
> 
> The configuration and hardware information used is described in [1].
> 
> Starting with the Linux 6.2 kernel, the following log is output to dmesg
> when a problem occurs.
> ...
> [ 15.049948] pcieport 0000:00:01.0: Data Link Layer Link Active not set
> in 1000 msec
> [ 15.050024] pcieport 0000:01:00.0: Unable to change power state from
> D3cold to D0, device inaccessible
> [ 15.051067] pcieport 0000:02:01.0: Unable to change power state from
> D3cold to D0, device inaccessible
> [ 15.052141] pcieport 0000:02:04.0: Unable to change power state from
> D3cold to D0, device inaccessible
> [ 17.286554] vfio-pci 0000:03:00.0: not ready 1023ms after resume;
> giving up
> [ 17.286553] vfio-pci 0000:04:00.0: not ready 1023ms after resume;
> giving up
> [ 17.286576] vfio-pci 0000:03:00.0: Unable to change power state from
> D3cold to D0, device inaccessible
> [ 17.286578] vfio-pci 0000:04:00.0: Unable to change power state from
> D3cold to D0, device inaccessible
> ...
> 
> And if you check the DG2 hardware using the "lspci -nnv" command, you
> will see that "Flags:" is displayed as "!!! Unknown header type 7f" as
> shown below. [2]
> The normal output log looks like [3].
> 
> This issue has been occurring since the patch below was applied. [4]
> 
> d8d2b65a940bb497749d66bdab59b530901d3854 is the first bad commit
> commit d8d2b65a940bb497749d66bdab59b530901d3854
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Fri Dec 9 11:01:00 2022 -0600
> 
>     PCI/portdrv: Allow AER service only for Root Ports & RCECs
> 
> 
> Rolling back the [4] patch makes it work on boot with the latest version
> of the kernel, but the same problem still occurs after "suspend to s2idle".
> This problem existed even before applying [4].
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced d8d2b65a940bb4
#regzbot title PCI/portdrv: vfio-pci driver fails to work with Intel DG2
(A770) discrete graphics
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
