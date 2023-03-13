Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9723A7
	for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678701943; x=1710237943;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=6gFmbIAWDSqRvlgHSxERMJQseuQtXYCPnBqmsfcwLcc=;
  b=azh2OsI0oiSNYbUs89wTwMyU5R/Rhl97EZlcSrpmRuNCGCGigxPTOvp3
   FIKjLuJyDc+3HxzllfZagQrDJI0W8O6osr7wwFHGpDtmrabLYG5URXtAx
   n8djDO02Hm+EWx0NQqN7+1rURIbw75a1NpRGI0qVk7yY1+4QvWTJnKCnQ
   ll/uZ3vOvtdX9n6FsfOCvR2ssiTy70/390oOUYccCyzQEx3Ow9sBxwSIG
   L2SlTbyEkhfRV4NOnfqQ2uyUOpVuKH5PvkX8oKp0lyHtQMVNW3QCou7qX
   4vTyv0IbdWK2mh6RWbv0FxULjH+qlklBVoO+zfcCbmP/8EcZ8FHcA8pxb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423374255"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="423374255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821897378"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="821897378"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2023 03:05:41 -0700
Message-ID: <d5ff9480-57bd-2c39-8b10-988ad0d14a7e@linux.intel.com>
Date: Mon, 13 Mar 2023 12:06:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To: Brian Morrison <bdm@fenrir.org.uk>
Cc: linux-usb@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
 <db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
 <20230309200415.118777d2@deangelis.fenrir.org.uk>
 <20230312000316.2955d55a@deangelis.fenrir.org.uk>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB regression in kernel 6.2.2
In-Reply-To: <20230312000316.2955d55a@deangelis.fenrir.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.3.2023 2.03, Brian Morrison wrote:
> On Thu, 9 Mar 2023 20:04:15 +0000
> Brian Morrison <bdm@fenrir.org.uk> wrote:
> 
>> On Wed, 8 Mar 2023 17:16:01 +0200
>> Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>>   
>>>
>>> Looks like that those devices initially enumerated fine, but
>>> suddenly disconnect about 19 seconds after boot.
>>>
>>> [   19.155556] usb 2-1.1: USB disconnect, device number 4
>>> [   19.155685] cp210x ttyUSB0: cp210x converter now disconnected
>>> from ttyUSB0 [   19.159290] usb 2-1.4: USB disconnect, device
>>> number 6 [   19.242344] usb 2-1.4: 3:0: failed to get current value
>>> for ch 0 (-22) [   20.100761] usb 2-4.1: USB disconnect, device
>>> number 8 [   20.100894] cp210x ttyUSB1: cp210x converter now
>>> disconnected from ttyUSB1 [   20.100999] cp210x 2-4.1:1.0: device
>>> disconnected [   20.107188] usb 2-4.2: USB disconnect, device
>>> number 9 [   20.107253] cp210x ttyUSB2: cp210x converter now
>>> disconnected from ttyUSB2 [   20.107284] cp210x 2-4.2:1.0: device
>>> disconnected [   20.111938] usb 2-4.4: USB disconnect, device
>>> number 10 [   20.181363] usb 2-4.4: 3:0: failed to get current
>>> value for ch 0 (-22)
>>>
>>> Interestingly those are all the devices behind external hubs.
>>>
>>> Bisecting this to find the offending commit would be best, but a
>>> dmesg with xhci and usb core dynamic debug enabled could also show
>>> why those devices disconnect.
>>>
>>> Adding "usbcore.dyndbg=+p xhci_hcd.dyndbg=+p" to your kernel cmdline
>>> should do this.
>>
>> In addition to the debug output I have been looking at the diff
>> between kernel-6.1 and kernel-6.2 in the /drivers/usb tree, in
>> particular under /drivers/usb/core/hub.h and /drivers/usb/core/hub.c
>> where the vendor for this device with VID 0451 is newly listed
>> although its PID is not:
>>
>> Bus 003 Device 002: ID 0451:2046 Texas Instruments, Inc. TUSB2046 Hub
>>
>> this device is missing from lsusb output in kernel 6.2.2 but is
>> present with kernel 6.1.*
> 
> I was wrong about this, it's the devices on the far side of the TI and
> SMSC hub devices that are missing, not the hubs themselves.
> 
>>
>> In my inexpert way I think it is all tied in to changes from a few
>> months ago (November 2022) that went into the 6.2rc kernels where the
>> early_stop capability was added to USB enumeration but I am certainly
>> not smart enough to identify exactly why the particular combination of
>> hardware I have is caught up in it. I can see from the extended dmesg
>> output that certain USB interfaces are unregistered for no obvious
>> reason and that once this happens they are invisible to the OS. The
>> altered USB core code would seem to be a prime suspect as the cause of
>> this regression.
>>
> 
> Further testing with kernels 6.1.18 and 6.2.5 is added to the bug entry
> here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2175534#c12
> 
> I don't know how to bisect this with the available Fedora kernels.
> 


In your v6.2 logs the usb bus numbers are interleaved, in the v6.1 they
are not. xhci driver registers two usb buses per host, one High-Speed and
one SuperSpeed.

in v6.2:

[    1.094679] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    1.094695] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 2
[    1.096690] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    1.100549] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4

in 6.1:

[    1.071987] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    1.073300] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    1.076445] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 3
[    1.082133] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4

0000:00:14.0 is your Intel xHC
0000:04:00.0 is your Renesas xHC

This change could be due to 6.2 commit:

4c2604a9a689 usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS

Not sure why it would cause this regression, but worth testing it.

Can you try to revert that commit?
Or alternatively unbind and rebind the hosts from the xhci driver:

echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
echo 0000:04:00.0 > /sys/bus/pci/drivers/xhci_hcd/unbind

(all your usb devices should now be disconnected)

echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/bind
<wait a couple seconds>
echo 0000:04:00.0 > /sys/bus/pci/drivers/xhci_hcd/bind

Thanks
Mathias
