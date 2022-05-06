Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B72807
	for <regressions@lists.linux.dev>; Fri,  6 May 2022 11:43:33 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nmwMn-0000GL-9t; Fri, 06 May 2022 13:43:25 +0200
Message-ID: <9251bd7f-047d-544c-3360-df9be7c78f79@leemhuis.info>
Date: Fri, 6 May 2022 13:43:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] net: atlantic: invert deep par in pm functions,
 preventing null derefs #forregzbot
Content-Language: en-US
To: regressions@lists.linux.dev
References: <87sfqaa8n5.fsf@posteo.de>
From: Thorsten Leemhuis <linux@leemhuis.info>
In-Reply-To: <87sfqaa8n5.fsf@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1651837413;4c6564f7;
X-HE-SMSGID: 1nmwMn-0000GL-9t

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot fixed-by: cbe6c3a8f8f4

On 18.04.22 14:17, Manuel Ullmann wrote:
> From: Manuel Ullmann <labre@posteo.de>
>>From 6c4cd8210835489da84bf4ee5049945dc0f2c986 Mon Sep 17 00:00:00 2001
> Date: Mon, 18 Apr 2022 00:20:01 +0200
> 
> This will reset deeply on freeze and thaw instead of suspend and
> resume and prevent null pointer dereferences of the uninitialized ring
> 0 buffer while thawing.
> 
> The impact is an indefinitely hanging kernel. You can't switch
> consoles after this and the only possible user interaction is SysRq.
> 
> BUG: kernel NULL pointer dereference
> RIP: 0010:aq_ring_rx_fill+0xcf/0x210 [atlantic]
> aq_vec_init+0x85/0xe0 [atlantic]
> aq_nic_init+0xf7/0x1d0 [atlantic]
> atl_resume_common+0x4f/0x100 [atlantic]
> pci_pm_thaw+0x42/0xa0
> 
> resolves in aq_ring.o to
> 
> ```
> 0000000000000ae0 <aq_ring_rx_fill>:
> {
> /* ... */
>  baf:	48 8b 43 08          	mov    0x8(%rbx),%rax
>  		buff->flags = 0U; /* buff is NULL */
> ```
> 
> The bug has been present since the introduction of the new pm code in
> 8aaa112a57c1 ("net: atlantic: refactoring pm logic") and was hidden
> until 8ce84271697a ("net: atlantic: changes for multi-TC support"),
> which refactored the aq_vec_{free,alloc} functions into
> aq_vec_{,ring}_{free,alloc}, but is technically not wrong. The
> original functions just always reinitialized the buffers on S3/S4. If
> the interface is down before freezing, the bug does not occur. It does
> not matter, whether the initrd contains and loads the module before
> thawing.
> 
> So the fix is to invert the boolean parameter deep in all pm function
> calls, which was clearly intended to be set like that.
> 
> First report was on Github [1], which you have to guess from the
> resume logs in the posted dmesg snippet. Recently I posted one on
> Bugzilla [2], since I did not have an AQC device so far.
> 
> #regzbot introduced: 8ce84271697a
> #regzbot from: koo5 <kolman.jindrich@gmail.com>
> #regzbot monitor: https://github.com/Aquantia/AQtion/issues/32
> 
> Fixes: 8aaa112a57c1 ("net: atlantic: refactoring pm logic")
> Link: https://github.com/Aquantia/AQtion/issues/32 [1]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215798 [2]
> Cc: stable@vger.kernel.org
> Reported-by: koo5 <kolman.jindrich@gmail.com>
> Signed-off-by: Manuel Ullmann <labre@posteo.de>
> ---
> Once in mainline, this should be backported to 5.10 and newer
> supported stable branches. Although 5.4 includes the bug, it is not
> affected (see above).
> 
> As a side effect, this might increase suspend/resume performance,
> although I did no measurements.
>  
>  drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
> index 797a95142d1f..3a529ee8c834 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
> @@ -444,22 +444,22 @@ static int atl_resume_common(struct device *dev, bool deep)
>  
>  static int aq_pm_freeze(struct device *dev)
>  {
> -	return aq_suspend_common(dev, false);
> +	return aq_suspend_common(dev, true);
>  }
>  
>  static int aq_pm_suspend_poweroff(struct device *dev)
>  {
> -	return aq_suspend_common(dev, true);
> +	return aq_suspend_common(dev, false);
>  }
>  
>  static int aq_pm_thaw(struct device *dev)
>  {
> -	return atl_resume_common(dev, false);
> +	return atl_resume_common(dev, true);
>  }
>  
>  static int aq_pm_resume_restore(struct device *dev)
>  {
> -	return atl_resume_common(dev, true);
> +	return atl_resume_common(dev, false);
>  }
>  
>  static const struct dev_pm_ops aq_pm_ops = {
> 
> base-commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
