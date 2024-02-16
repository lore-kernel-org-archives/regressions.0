Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCD81C286
	for <regressions@lists.linux.dev>; Fri, 16 Feb 2024 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076845; cv=none; b=uIgLwyevwmpXGJEMsySaLAjkPf1tiMQlYEcF4QhgQPCE49st08WfyRPfUyNBIXxE9iiIQIFz8UMrE0vQqpOMkymp+dTF2uiD0JWuX0s49wotwV3rWaZWB3m9crbxEDPHtHDqQygSBHYzfXL2UmFaF8BSaKUTNNxGiR+KgDAkxUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076845; c=relaxed/simple;
	bh=4K/eUyMV65uL0n3vYZNnPq8ZHdComXhrXysSnRGCXcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqU+jOtS2fCtDT7yMC0KIW630NOKszMWXS+on1DoxmaamN/4j16JKqgwgKCl7Z5cwcoS4cc9idCNWbpHn0IdPdxNDS1edARdzxGwUBIk7v5KGeGb7TuMmO+VHS9/YIk+1bFGRuXIcisQqBh9lP4GMaOwO0GetUDrBdsAdc3oO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FM+prlc6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FM+prlc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708076844; x=1739612844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4K/eUyMV65uL0n3vYZNnPq8ZHdComXhrXysSnRGCXcY=;
  b=FM+prlc6ln6fMqjacfWvfagkbL4NlWMNz58sJJq0Od7E5LHrYxHV2X4n
   mIT4ss5GWwbgqmvhsOkyKzMRfjZnW/2sSplZuEMyNicdKXRuVh0VY2l4x
   9EVrdA2anWLq3YiuNkRtE/hmLXFtlIXpJ3ZVd4dnnNv8fd5ON+6YxcwNN
   tL0GW2HXHXHV7ircHk8VOR5995Ylp6GzPHM9ooVWRXRzBwxh1TRclWHIk
   vBInGWYZt+kecKmwoAEa6Q5ZykkV27i/DT3BZ+K8li65DvdKNxckY4X7V
   dqh0P3ZQr5AgLoJ7KtKAY8t9wg+L4jLXqxTfAkNa8qLlhPfuAdVxi5hF9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13304734"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="13304734"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 01:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935815103"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="935815103"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2024 01:47:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E5F4E268; Fri, 16 Feb 2024 11:47:19 +0200 (EET)
Date: Fri, 16 Feb 2024 11:47:19 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Olliver Schinagl <oliver@schinagl.nl>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] thunderbolt: Fix NULL pointer dereference in
 tb_port_update_credits()
Message-ID: <20240216094719.GN8454@black.fi.intel.com>
References: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>

On Mon, Feb 12, 2024 at 01:51:32PM +0200, Mika Westerberg wrote:
> Olliver reported that his system crashes when plugging in Thunderbolt 1
> device:
> 
>  BUG: kernel NULL pointer dereference, address: 0000000000000020
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 0 P4D 0
>  Oops: 0000 [#1] PREEMPT SMP NOPTI
>  RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
>  Call Trace:
>   <TASK>
>   ? __die+0x23/0x70
>   ? page_fault_oops+0x171/0x4e0
>   ? exc_page_fault+0x7f/0x180
>   ? asm_exc_page_fault+0x26/0x30
>   ? tb_port_do_update_credits+0x1b/0x130
>   ? tb_switch_update_link_attributes+0x83/0xd0
>   tb_switch_add+0x7a2/0xfe0
>   tb_scan_port+0x236/0x6f0
>   tb_handle_hotplug+0x6db/0x900
>   process_one_work+0x171/0x340
>   worker_thread+0x27b/0x3a0
>   ? __pfx_worker_thread+0x10/0x10
>   kthread+0xe5/0x120
>   ? __pfx_kthread+0x10/0x10
>   ret_from_fork+0x31/0x50
>   ? __pfx_kthread+0x10/0x10
>   ret_from_fork_asm+0x1b/0x30
>   </TASK>
> 
> This is due the fact that some Thunderbolt 1 devices only have one lane
> adapter. Fix this by checking for the lane 1 before we read its credits.
> 
> Reported-by: Olliver Schinagl <oliver@schinagl.nl>
> Closes: https://lore.kernel.org/linux-usb/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
> Fixes: 81af2952e606 ("thunderbolt: Add support for asymmetric link")
> Cc: stable@vger.kernel.org
> Cc: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
