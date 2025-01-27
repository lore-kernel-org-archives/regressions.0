Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1958C11
	for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 03:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737948433; cv=none; b=Qd4lQ0dbytIXktqAfe7QbmQ+2wBq530IkNPz4sXbnhfpdTMmK7GLC5EXDt+GEyT/IuL6ypQYOvjyJcyOe9HWxgkYGI/WiH+PvM0INtPO6z2qnSOFtoGaW8u1rMKxrrUIbwkwBgHrbJE5iIob5701zBgY9ivtgpCnGBqg36ZBt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737948433; c=relaxed/simple;
	bh=HVbQuaSI1DnXfN8+nVJSXnhggj7yx7c5oTISzXRo8ik=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=CNIxB3OKIzweReoUNPX3Sdj87jq0J+Low+Lp0eWUt7qWYg95GKvSa8+CxHeurFSelgcxKG5J9R4K0r+ArfmsAK3LhcrqMbSlSg0KaYfamxrDbP6w+949EWjGVoI2+yNAaH/6Nv94LmKZR/Vu8YZv8ZQ8T66TAkmZdNcWXA+41oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YhDL84yXCzRm1g;
	Mon, 27 Jan 2025 11:24:32 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 267911402CF;
	Mon, 27 Jan 2025 11:27:08 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Jan 2025 11:27:07 +0800
Message-ID: <7b535c35-9aeb-4a60-ab42-438f70835137@huawei.com>
Date: Mon, 27 Jan 2025 11:27:01 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
Subject: Re: Possible hungtask issue will be introduced with device_lock() in
 uevent_show()
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-kernel@vger.kernel.org>, <rafael.j.wysocki@intel.com>,
	<regressions@lists.linux.dev>, <tj@kernel.org>, <alex.williamson@redhat.com>,
	<chenjun102@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
References: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
 <20241231075608.84009-1-zhangzekun11@huawei.com>
 <2024123128-monetize-outtakes-3260@gregkh>
 <7b599394-d1a1-4e13-9c5c-48321172ec65@huawei.com>
 <6791a45f711e2_9b922948@dwillia2-mobl3.amr.corp.intel.com.notmuch>
In-Reply-To: <6791a45f711e2_9b922948@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500003.china.huawei.com (7.202.181.241)


> Hi Zekun,
> 
> If you have some cycles to help investigate the replacement fix that
> would be much appreciated.
> 
> So far I came up with this:
> 
> http://lore.kernel.org/172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com
> 
> ...but have not had time to debug the 0day report.
> 
> My worry is still that Linux has long since shipped the expectation that
> reading 'uevent' bounces the device_lock() which, among other things,
> makes sure that any in-flight driver probing has completed.
> 
> The report of USB devices disappearing is consistent with a udev
> operation failing due to the driver not being done attaching, or
> something similar.
> 
> So even though you have not seen any issues, I suspect small differences
> in the devices on your system and the reporter's system, or udev rule
> differences could result in a failure to trigger the regression.
> 
> 
Hi, Dan

The patch trys to prevent the potential dead lock by letting 
device_lock() gets before kernfs_get_active(), but I think it might not 
be enough to solve all the potential dead lock. The device_lock() will 
be held while removing the driver in device_release_driver(), which 
means will be held through driver's .remove(). If .remove() is waiting 
for resources to be released by userspace process, and then the 
userspace process call device_lock() in uevent_show(), we will have dead 
locks here.

In the following case:

device_release_driver
device_lock()          blocked by
<operation 1> ---------------------------> <operation 2>
                                            uevent_show()
                                            device_lock()


In [1], It is beacause that pci_stop_and_remove_bus_device() will call 
device_release_driver() first and then call device_del() to remove the 
uevent sysfs attributes （Sorry for mistakes made in [1], 
device_release_driver() is called by pci_stop_bus_device()). So, I think 
it might not be a good idea to hold the device_lock() through uevent_show().

ioctl(..,VFIO_GROUP_GET_DEVICE_FD,..)
         ...
         vfio_device_get_from_name()
         vfio_devcie->refcount -> 2
                                         pci_stop_and_remove_bus_device()
                                         pci_stop_bus_device（）
                                         device_release_driver()
                                         device_lock()
                                         device_remove()
												vfio_unregister_group_dev()
												vfio_device_put_registration()
												vfio_devcie->refcount -> 1
												wait for refcount == 0
uevent_show()
         device_lock()

[1] 
https://lore.kernel.org/lkml/20241231075608.84009-1-zhangzekun11@huawei.com/

Best Regards,
Zekun
