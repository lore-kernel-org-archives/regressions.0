Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF014AB3
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693314013; x=1724850013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ww6lG9AEXbEHC3JeW3IuCVPvO2zBtxhxqYwtuiEndOs=;
  b=a2DlsiP+7Tpzw7wOW1op7r4K/W5NPi1yTtTEm8G9GW+fcX4X3hfEdild
   XOT5LXXexPF1+OANqWmksEy7VA4DHTmiDx3klPLDs45hHPaFqdbP1qztl
   U+N02PXKRJZ2hvDwvnaXFBW2zXbCNxXbPdJjM8EBAYgCjTg9P4zvR88AG
   3aqsk/0cALotM6zjjMtB4JOdGgBeLZKHZaQSUftfTclXdI+P2GEpauyzA
   7pAPJAOmfPfjrfjMx0yxWe9bVeJxFHVeNDtauHwjAnrlLZjMotMZTl+l3
   8qm3h1BIw9k0r6XuYfmjGWChCeiIKR7/G9mrElQl/p+yJAK0c0dkE1Vns
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378077244"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="378077244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 05:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="768062009"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="768062009"
Received: from sguenant-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.213.107])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 05:59:41 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 25FA910A6AF; Tue, 29 Aug 2023 15:59:39 +0300 (+03)
Date: Tue, 29 Aug 2023 15:59:39 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Aaron Lu <aaron.lu@intel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: kexec reboot failed due to commit 75d090fd167ac
Message-ID: <20230829125939.bcg2r6hwqf45npko@box.shutemov.name>
References: <20230829114816.GA508985@ziqianlu-dell>
 <ZO3hQ0rbr8QuUjVI@debian.me>
 <20230829125134.GA509331@ziqianlu-dell>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829125134.GA509331@ziqianlu-dell>

On Tue, Aug 29, 2023 at 08:51:34PM +0800, Aaron Lu wrote:
> On Tue, Aug 29, 2023 at 07:14:59PM +0700, Bagas Sanjaya wrote:
> > On Tue, Aug 29, 2023 at 07:48:16PM +0800, Aaron Lu wrote:
> > > Hi Kirill,
> > > 
> > > Ever since v6.5-rc1, I found that I can not use kexec to reboot an Intel
> > > SPR test machine. With git bisect, the first bad commit is 75d090fd167ac
> > > ("x86/tdx: Add unaccepted memory support").
> > > 
> > > I have no idea why a tdx change would affect it, I'm not doing anything
> > > related to tdx.
> > > 
> > > Any ideas?

Are we talking about bare metal? Or is it kexec in a VM?

> > > The kernel config is attached, let me know if you need any other info.
> > 
> > Can you provide system logs (e.g. journalctl output) when attempting to
> > reboot?
> 
> ... ...
> Aug 29 19:15:59 be3af2b6059f systemd-shutdown[1]: Syncing filesystems and block devices.
> Aug 29 19:15:59 be3af2b6059f systemd-shutdown[1]: Sending SIGTERM to remaining processes...
> Aug 29 19:16:00 be3af2b6059f systemd-journald[2629]: Journal stopped
> -- Boot 7e5173842b8b4be581886ff25ad0c02f --
> Aug 29 19:24:27 be3af2b6059f kernel: microcode: updated early: 0x2b000161 -> 0x2b000461, date = 2023-03-13
> Aug 29 19:24:27 be3af2b6059f kernel: Linux version 6.3.8-100.fc37.x86_64 (mockbuild@bkernel02.iad2.fedoraproject.org)
> Aug 29 19:24:27 be3af2b6059f kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-6.3.8-100.fc37.x86_64 root=UUID=4381321e-e0>
> 
> First 3 lines are from the first kernel, then I attmpted to kexec reboot
> to 6.4.0-rc5-00009-g75d090fd167a and remote console hanged with the
> reboot message of the first kernel. After a while, I know kexec failed
> so I power cycled the machine to boot into a distro kernel, that is the
> last 3 lines. There is no trace of the failed boot.
> 
> I guess the kexeced kernel failed to start early in the boot process
> so the log is probably only available in serial, if any. Unfortunately,
> there is no serial support for this machine.

Could you show dmesg of the first kernel before kexec?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
