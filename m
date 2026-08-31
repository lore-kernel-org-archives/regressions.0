Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC63DD870
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168114; cv=none; b=PIQxm0sV4PAQqUryQ40OlAN+Dc8brI0DHBXW87unC9MbrEt2B6c/JgpC7xF4AVIHPUZozq7x06X4nOoYxJnEQZX78OA24etUihM1RIcaOIKuuZyxEVCllulBMafmPh7kFHNFPzE5zgnbRBBRZ6kirVj0NKeuXPO8/9zPXOjaQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168114; c=relaxed/simple;
	bh=nE5qrzKBb2CTapNtRYiI1LnBzdqfo6itleuF6g6tnNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icrvG7phL1sOZdNLF/PryRi0YtHEDzoRxKFFhMhBxFnZh/klUB/s1J0VERL7n6gq2fzJVFBKRbmP92WC5XDroARwCppMN3LXzTYFUF7kF6MqKpVi0Oi3GN9J4E0vwI2ZlpsLbC6/QCgrqcxNU/RfIgqBdEglLHS3z47HBMaPY3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/WYjdgA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/WYjdgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168112; x=1819704112;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nE5qrzKBb2CTapNtRYiI1LnBzdqfo6itleuF6g6tnNM=;
  b=O/WYjdgAv2wN+p+p0vmZM6bQmyl31M4t6FSGqV+6tUf8RZFXY2f8t1dA
   XPpI7ZYNkSqQO4Q0Z3piWIDvAnsDePbUp0Ze6UOLkQUqtd9UOlr+O88Qr
   3Lf0xCPl91vp0jY3Pj9GLHg7fPOyTQmlNoRu1xg0MzDJyIc4ioZOqEv8O
   ge2EnMBYekUWhM0RLb+qXHEJDvMlq4xGP3rYBNTbaLo7Z9izFGPCXaYG+
   YHiTxgYHZjqyf/Uct/3DKxGt83L1lLBiLDlq57UfOUwRFe/WcjLgIC9MG
   1cktDf8deBhPrZ8G0jal5Qg9MYkeyHPYCBegPb0hOdVkQ4ExFO0tkToiB
   g==;
X-CSE-ConnectionGUID: 7HHL8T0xTQ2l28riP/kJlQ==
X-CSE-MsgGUID: +A5rcm2STEu3P3sa7ZkTJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76119095"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="76119095"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:21:51 -0700
X-CSE-ConnectionGUID: KCOVgDKHS0myaom0zw//0A==
X-CSE-MsgGUID: 6Dw3w3PAR1OHTJdgjqnO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265505862"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.13]) ([10.245.244.13])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:21:49 -0700
Message-ID: <81ddd491-1ec3-4a0c-90b3-6a286ff1a908@linux.intel.com>
Date: Mon, 31 Aug 2026 12:21:46 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Pierre-David Belanger <pierredavidbelanger@gmail.com>,
 Shixiong Ou <oushixiong1025@163.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260828105926.930033-1-oushixiong1025@163.com>
 <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
 <64a7ce30-b346-4e94-974f-f30893d66829@leemhuis.info>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <64a7ce30-b346-4e94-974f-f30893d66829@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 09:55, Thorsten Leemhuis wrote:
> On 8/30/26 05:12, Pierre-David Belanger wrote:
> 
>> The failure on 08dbfad3f504:
>>
>>    xhci_hcd 0000:00:04.0: xHCI Host Controller
>>    xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
>>    xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
>>    xhci_hcd 0000:00:04.0: can't setup: -12
>>    xhci_hcd 0000:00:04.0: USB bus 1 deregistered
>>    xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
>>    xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with error -12
> FWIW, not my area of expertise, but to me it looks like there were two
> similar fixes submitted earlier to address this and "usb: xhci: Fix
> HCS_ERST_MAX conversion" (
> https://lore.kernel.org/all/20260828105926.930033-1-oushixiong1025@163.com/
> ) seems to be heading towards mainline already according to Mathias.
> Sadly this missed -rc1, wonder why it wasn't submitted for it to prevent
> more people from running into this, but whatever, that's ship has sailed.

Looks like at least QEMU and Mediatek users were hit by this issue.

Note that this is a v7.3-rc1 regression which was found during merge window for v7.3-rc1.
v7.3-rc1 came out a few hours ago.
I can't resolve it much earlier than this.

Thanks
Mathias

