Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1956AB0
	for <regressions@lists.linux.dev>; Mon, 29 May 2023 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685360291; x=1716896291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xp6DOmsiV051RKXvtEe9tCC5u7UbWlALrAF8xAyV7dI=;
  b=DjeQsLGiU5DKTwRvVR2EFLM48XUJyTqIpdoHMS8INTorCaJO22cVKd7w
   HZ6GWQgDZd2uTBBn6jeEHhO1r2qAo5zgbrBfMcevfXv0MXna95+W8JPX2
   qeZbHyE8yCUEjn1SHNdSUedmRvJOMR4wiTEb4bFsXUIWjBr3K/ca6gdsX
   zWgNBOhVRVFJccwSrX0iWzy5KgYGdhsvRW73uIIuGgjiE5sPZI9HsJfZD
   qTqCmHygofrukDO2cnSPlQ5bDvsu94ysrW9Z24I2WSAx/2xm6kE+VnY39
   V0gTppsMPghUb4Wsz+7dswcXwOeIFN4mHi2xXDLtrhvlLj/YMK7z9+lAU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354699070"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354699070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 04:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="1036190570"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="1036190570"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 May 2023 04:38:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4A5C3350; Mon, 29 May 2023 14:38:13 +0300 (EEST)
Date: Mon, 29 May 2023 14:38:13 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, beld zhang <beldzhang@gmail.com>,
	stable@vger.kernel.org, Linux USB <linux-usb@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: 6.1.30: thunderbolt: Clear registers properly when auto clear
 isn't in use cause call trace after resume
Message-ID: <20230529113813.GZ45886@black.fi.intel.com>
References: <CAG7aomXv2KV9es2RiGwguesRnUTda-XzmeE42m0=GdpJ2qMOcg@mail.gmail.com>
 <ZHKW5NeabmfhgLbY@debian.me>
 <261a70b7-a425-faed-8cd5-7fbf807bdef7@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <261a70b7-a425-faed-8cd5-7fbf807bdef7@amd.com>

On Sun, May 28, 2023 at 07:55:39AM -0500, Mario Limonciello wrote:
> On 5/27/23 18:48, Bagas Sanjaya wrote:
> > On Sat, May 27, 2023 at 04:15:51PM -0400, beld zhang wrote:
> > > Upgrade to 6.1.30, got crash message after resume, but looks still
> > > running normally
> 
> This is specific resuming from s2idle, doesn't happen at boot?
> 
> Does it happen with hot-plugging or hot-unplugging a TBT3 or USB4 dock too?

Happens also when device is connected and do

  # rmmod thunderbolt
  # modprobe thunderbolt

I think it is because nhi_mask_interrupt() does not mask interrupt on
Intel now.

Can you try the patch below? I'm unable to try myself because my test
system has some booting issues at the moment.

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 4c9f2811d20d..a11650da40f9 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -60,9 +60,12 @@ static int ring_interrupt_index(const struct tb_ring *ring)
 
 static void nhi_mask_interrupt(struct tb_nhi *nhi, int mask, int ring)
 {
-	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT)
-		return;
-	iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + ring);
+	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT) {
+		u32 val = ioread32(nhi->iobase + REG_RING_INTERRUPT_BASE + ring);
+		iowrite32(val & ~mask, nhi->iobase + REG_RING_INTERRUPT_BASE + ring);
+	} else {
+		iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + ring);
+	}
 }
 
 static void nhi_clear_interrupt(struct tb_nhi *nhi, int ring)
