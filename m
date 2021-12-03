Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A42C9D
	for <regressions@lists.linux.dev>; Fri,  3 Dec 2021 10:56:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="297750808"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="297750808"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 02:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="655912586"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2021 02:56:03 -0800
To: Robert Munteanu <rombert@apache.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tiwai@suse.com, regressions@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Regression: plugging in USB scanner breaks all USB functionality
Message-ID: <a649395b-0b91-a0d2-c510-ea8ec4aef917@linux.intel.com>
Date: Fri, 3 Dec 2021 12:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2.12.2021 16.55, Robert Munteanu wrote:
> Hi,
> 
> After updating from kernel 5.14.11 to 5.14.14 I am seeing the following
> problem:
> 
> When plugging in an USB scanner ( Brother DSMobile DS-740D ) to my
> Lenovo P52 laptop I lose connection to all USB devices. Not only are
> the devices no longer available on the host, but no power is drawn by
> them. Only a reboot fixes the problem.
> 
> The scanner is the only device that triggers the problem, even when it
> is the only device plugged in. I have a host of other devices,
> connected either directly or via a USB hub in my monitor:
> 

There is one xhci patch in that range that has caused other issues:
ff0e50d3564f xhci: Fix command ring pointer corruption while aborting a command

That patch has a fix that is not yet applied, fix can be found here:
https://lore.kernel.org/linux-usb/20211126122340.1193239-2-mathias.nyman@linux.intel.com/
or
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=for-usb-linus&id=385b5b09c3546c87cfb730b76abe5f8d73c579a2

Does reverting the original patch, or applying the fix help?

Thanks
-Mathias


 
