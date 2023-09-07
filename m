Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FA63D8
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694092695; x=1725628695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6ZhqWgwoI8MAxW6/N8+5IhjZO91cgxHuTDSEqgn/Ok=;
  b=dyKaXAa/CPfbdrfcoy0h6ezwq3JNRioXo9VrJgmcB91zb5yLhaPpKyG5
   v99Cb+XByG/8RyMtvXj/ROcr+cqcyyKKbbE8nM4oKttcCvz63hZlsxBU3
   u16akE/rYrJVyIkPQv/pDwV7LWV6uA7fWLCyv4FEpYKnBYQe+t8EfsBEv
   xRdhoxBDE4bSKv9LazAZuZMWFGRQe01yMIqoTDy+0WgW+nc2NRomkFwKt
   ZCRFMORU5YFZ9zyiRvKjygmqJmj/BIJ/ATAdcLnNWbYkM2RwzNW6pj3CZ
   yAt1WkTOdSV8nNPjl3GFmP4289Mf0oHbSmtUSOpflRYckiDr5FG/9/7ce
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367579636"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="367579636"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 06:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="885141188"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="885141188"
Received: from oshragax-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.215.248])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 06:13:58 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 73345104860; Thu,  7 Sep 2023 16:14:09 +0300 (+03)
Date: Thu, 7 Sep 2023 16:14:09 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Aaron Lu <aaron.lu@intel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: kexec reboot failed due to commit 75d090fd167ac
Message-ID: <20230907131409.masxz42ik6u456qp@box.shutemov.name>
References: <20230829114816.GA508985@ziqianlu-dell>
 <ZO3hQ0rbr8QuUjVI@debian.me>
 <20230829125134.GA509331@ziqianlu-dell>
 <20230829125939.bcg2r6hwqf45npko@box.shutemov.name>
 <20230829140451.GA509854@ziqianlu-dell>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829140451.GA509854@ziqianlu-dell>

On Tue, Aug 29, 2023 at 10:04:51PM +0800, Aaron Lu wrote:
> > Could you show dmesg of the first kernel before kexec?
> 
> Attached.
> 
> BTW, kexec is invoked like this:
> kver=6.4.0-rc5-00009-g75d090fd167a
> kdir=$HOME/kernels/$kver
> sudo kexec -l $kdir/vmlinuz-$kver --initrd=$kdir/initramfs-$kver.img --append="root=UUID=4381321e-e01e-455a-9d46-5e8c4c5b2d02 ro net.ifnames=0 acpi_rsdp=0x728e8014 no_hash_pointers sched_verbose selinux=0"

I don't understand why it happens.

Could you check if this patch changes anything:

diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 94b7abcf624b..172c476ff6f3 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -456,10 +456,12 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
 
 	debug_putstr("\nDecompressing Linux... ");
 
+#if 0
 	if (init_unaccepted_memory()) {
 		debug_putstr("Accepting memory... ");
 		accept_memory(__pa(output), __pa(output) + needed_size);
 	}
+#endif
 
 	__decompress(input_data, input_len, NULL, NULL, output, output_len,
 			NULL, error);
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
