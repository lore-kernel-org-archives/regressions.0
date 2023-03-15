Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817463C02
	for <regressions@lists.linux.dev>; Wed, 15 Mar 2023 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678879082; x=1710415082;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=Hu+gue/gvMdsNfCWleFLlSpjMnIki5YQ5h6kokY+5xo=;
  b=UwuwVMvEXmWf0lpXDhkhgFIErX3BN4G+mz5tDCHfQ7dvYStaoVVLxiXs
   NtTYFE5MpyYF+9TenthWWM7kO1AuoGkD7bgogh84noNlPrQdrjO0M0vz/
   bSDrrs6kVeil6GZFsrQDi/UgBrX70t9JmNWNRgJxmWp+ntS4D0UWv+M9W
   e7WDUHct0L0xJAHEWZhDVnykyUNWbs+VAwe4xXJ9EomucWm1KRCD0u732
   w+XdRMkV4RY6A4kKPgZi8MBdEKkvYtLfmo9DTRSWKLLfPCdSmsZ12BfK5
   V6DxPJHzHWgzkJno0J/gs3+JbGw9gbcWdj6eyi0K3ELkM9BIu3pWxbMV9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="318069061"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="318069061"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 04:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789758626"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="789758626"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 04:17:58 -0700
Message-ID: <c9b12beb-cb12-8839-db74-b18480885053@linux.intel.com>
Date: Wed, 15 Mar 2023 13:19:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
To: Brian Morrison <bdm@fenrir.org.uk>
Cc: linux-usb@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Alan Stern <stern@rowland.harvard.edu>, Chen Xingdi <chenxingdi@huawei.com>,
 Takashi Iwai <tiwai@suse.de>, Moritz Fischer <mdf@kernel.org>,
 Christian Lamparter <chunkeey@googlemail.com>, Vinod Koul <vkoul@kernel.org>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
 <db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
 <20230309200415.118777d2@deangelis.fenrir.org.uk>
 <20230312000316.2955d55a@deangelis.fenrir.org.uk>
 <d5ff9480-57bd-2c39-8b10-988ad0d14a7e@linux.intel.com>
 <20230314140008.79a90c38@deangelis.fenrir.org.uk>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB regression in kernel 6.2.2
In-Reply-To: <20230314140008.79a90c38@deangelis.fenrir.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.3.2023 16.00, Brian Morrison wrote:
> On Mon, 13 Mar 2023 12:06:59 +0200
> Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>>
>>
>> In your v6.2 logs the usb bus numbers are interleaved, in the v6.1
>> they are not. xhci driver registers two usb buses per host, one
>> High-Speed and one SuperSpeed.
>>
>> This change could be due to 6.2 commit:
>>
>> 4c2604a9a689 usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS
>>
>> Not sure why it would cause this regression, but worth testing it.
> 
> I have now reverted the above commit, it's only the one line in
> xhci-pci.c and it took a couple of hours to rebuild my kernel rpms which
> wasn't too bad.
> 
> With this change all of my USB devices are present again and the 3
> /dev/ttyUSB* nodes are all present and usable.
> 

Thanks for testing.
So setting PROBE_PREFER_ASYNCHRONOUS does trigger this issue for Renesas xHCI.

Was it so that with the devices connected to the Intel host everything worked
on 6.2 kernel?

Just to make sure that this is a vendor specific host issue and not generic xhci
driver issue.

If we can't quickly figure out the real reason for this then we just have to
revert that patch.

> I found this in the linux-usb list archives:
> 
> https://www.spinics.net/lists/kernel/msg4569289.html
> 
> and the first part of this patch series here:
> 
> https://www.spinics.net/lists/kernel/msg4569288.html
> 
> Should both of these patches be reverted? I assume so but I don't think
> I have anything that uses an ehci device to test it.
> 

Probably just the xhci one. I haven't heard of any ehci issues.

Alan (cc) would know better if there are any new odd ehci issues that can
be traced back to the async probe change.

> I know nothing about how this all works other than finding this:
> 
> "Note that the end goal is to switch the kernel to use asynchronous
> probing by default, so annotating drivers with
> PROBE_PREFER_ASYNCHRONOUS is a temporary measure that allows us to
> speed up boot process while we are validating the rest of the drivers."
> 
> which is at:
> 
> https://www.kernel.org/doc/html/v4.14/driver-api/infrastructure.html
> 
> so by the looks of it either this driver needs to initialise
> synchronously or there is a further problem which causes the bus
> ordering to be wrong but it also seems to be a work in progress so I
> don't know how this will eventually play out.
> 
  
Adding several persons who worked on xhci-pci-renesas.c in hope of figuring
this out.

Thanks
Mathias

