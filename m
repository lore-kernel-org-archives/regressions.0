Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C181B3C73FD
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119999; cv=none; b=mbUal5AAx4p9bEdc1fZxCpPrkN5B2aAzNW3arOA2asRJU0Evy1vac/y5WqF0EQWUHqshYo/Htj9YmBYXhSbrnC6IUajGj0mFD4Fy9YvRmXRluqgc64THqy+UVollcSCJkR7umBn9B6fdihLT7t0KGMQVCBs01xks1A8Bp2IcQeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119999; c=relaxed/simple;
	bh=PiGcvs5N9hrHZIfnormmBCpThQzK61Fj0nV/QvJSIfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjkUkc+ITpg3DHIFtZXsC+usDGb2fIoPGZJ0/eek9FjOMAr7VF8qGwo4P+poqapjHAt39HO9bmLxyoNOWaHaK4SY2AN6lL5akXBis9YBuVTTEIgVJ1hGeYYSOg8P/dq1PZ197hajVCRiFa0a5FYSqnWFzIsZcPS1+uz8ZnuDvuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2045772C8CC;
	Thu,  2 Apr 2026 11:44:09 +0300 (MSK)
Received: from pony.office.basealt.ru (unknown [193.43.10.9])
	by imap.altlinux.org (Postfix) with ESMTPSA id 15DC236D00D4;
	Thu,  2 Apr 2026 11:44:09 +0300 (MSK)
Received: by pony.office.basealt.ru (Postfix, from userid 500)
	id E5851360D79D; Thu,  2 Apr 2026 11:44:08 +0300 (MSK)
Date: Thu, 2 Apr 2026 11:44:08 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Sasha Levin <sashal@kernel.org>, 
	Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev
Subject: [regression] Re: Linux 6.12.75
Message-ID: <ac4lw9tTNn4baO_h@altlinux.org>
References: <20260304131402.83200-1-sashal@kernel.org>
 <20260304131402.83200-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304131402.83200-2-sashal@kernel.org>

Sasha,

1. I cannot find this commit posted on lore.kernel.org to report to
exact patch.

| From: Matt Roper <matthew.d.roper@intel.com>
| Date: Tue, 10 Sep 2024 16:47:29 -0700
| Subject: [PATCH 6.12/sisyphus] drm/xe: Switch MMIO interface to take xe_mmio
|  instead of xe_gt
| 
| [ Upstream commit a84590c5ceb354d2e9f7f6812cfb3a9709e14afa ]
| 
| Since much of the MMIO register access done by the driver is to non-GT
| registers, use of 'xe_gt' in these interfaces has been a long-standing
| design flaw that's been hard to disentangle.
| 
| To avoid a flag day across the whole driver, munge the function names
| and add temporary compatibility macros with the original function names
| that can accept either the new xe_mmio or the old xe_gt structure as a
| parameter.  This will allow us to slowly convert parts of the driver
| over to the new interface independently.
| 
| Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
| Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
| Link: https://patchwork.freedesktop.org/patch/msgid/20240910234719.3335472-54-matthew.d.roper@intel.com
| Stable-dep-of: 4a9b4e1fa52a ("drm/xe/mmio: Avoid double-adjust in 64-bit reads")
| Signed-off-by: Sasha Levin <sashal@kernel.org>
| ---
|  drivers/gpu/drm/xe/xe_mmio.h  |  72 +++++++++++++++----
|  drivers/gpu/drm/xe/xe_trace.h |   7 +-
|  drivers/gpu/drm/xe/xe_mmio.c  | 131 ++++++++++++++++------------------
|  3 files changed, 124 insertions(+), 86 deletions(-)

2. After this patch applied to 6.12.75 there is kernel NULL pointer
dereference BUG on MSI MAG H670 12th Gen Intel(R) Core(TM) i5-12600K
with ASRock Intel Arc B580 Challenger [Alchemist], 12GB:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
  CPU: 8 UID: 0 PID: 310 Comm: (udev-worker) Not tainted 6.12.79-6.12-alt1 #1
  Hardware name: Micro-Star International Co., Ltd. MS-7D25/MAG H670 TOMAHAWK WIFI DDR4(MS-7D25), BIOS H.N0 07/31/2025
  RIP: 0010:__xe_mmio_read32+0x23/0xe0 [xe]

The commit is found not by a git bisect (since it's reported by end
user and I cannot reproduce it on my hardware) but (by analyzing dmesg)
with:

  (gdb) list *__xe_mmio_read32+0x23
  0x35723 is in __xe_mmio_read32 (drivers/gpu/drm/xe/xe_mmio.c:195).
  190     static void mmio_flush_pending_writes(struct xe_mmio *mmio)
  191     {
  192     #define DUMMY_REG_OFFSET        0x130030
  193             int i;
  194
  195             if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
  196                     return;
  197
  198             /* 4 dummy writes */
  199             for (i = 0; i < 4; i++)

Then finding the suspecting commit:

  $ git log --oneline -G'XE_LUNARLAKE' v6.12.74..v6.12.75
  26a40327c25c drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt

6.18 and above are not affected by the bug. Also, they have another commit
modifying the line which is not present in 6.12 branch:

  ac596dee8008 drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro

Thanks,

#regzbot introduced: v6.12.75

Related drm/xe bug report https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7661

On Wed, Mar 04, 2026 at 08:14:02AM -0500, Sasha Levin wrote:
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3fd462fda6255..449e6c5636712 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -172,122 +180,118 @@ int xe_mmio_init(struct xe_device *xe)
> -static void mmio_flush_pending_writes(struct xe_gt *gt)
> +static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  {
>  #define DUMMY_REG_OFFSET	0x130030
> -	struct xe_tile *tile = gt_to_tile(gt);
>  	int i;
>  
> -	if (tile->xe->info.platform != XE_LUNARLAKE)
> +	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
>  		return;
>  
>  	/* 4 dummy writes */
>  	for (i = 0; i < 4; i++)
> -		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> +		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>  }
>  
