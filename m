Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7F17B421
	for <regressions@lists.linux.dev>; Tue, 31 Dec 2024 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632205; cv=none; b=b8LIvWAMqOP748I+mmBTgwVW04YNFNLvqkN0Vidz7H5prOElYEPOWqdldkajfZq5Vait0Zn1YD0lJYcLEowUCCiIXtHMQzXCS+5sRadJTJtoYC+Gi1oiEl9LVjTEb0LW9jNQfO32E/JRDYAsutuOFrH3dP7qSFe529JDzmvsAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632205; c=relaxed/simple;
	bh=bO7wcxaoDkG+9muBJ1RtLs5F4IVZZojm9IIP+mZ6yk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iaojfU8AizwlhMvI+FwSfqdkGHTSrWYACGG4MYOcrDwVd2bOxmt5VFgSRstMaerTgekZ6QshNB1oWatAEAnSynHh83HTPQo4wv3c0dLQnOP9+ew8bB6W8FysODYX2L4RBICzh4yGWAEmllwNCg1PrXNCG3pa/ZEEJZCBpgDMoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YMll05XtrzhZW2;
	Tue, 31 Dec 2024 16:00:28 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id D1C27180A9E;
	Tue, 31 Dec 2024 16:03:14 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 31 Dec
 2024 16:03:13 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <dan.j.williams@intel.com>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<rafael.j.wysocki@intel.com>, <regressions@lists.linux.dev>, <tj@kernel.org>,
	<alex.williamson@redhat.com>, <chenjun102@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: Possible hungtask issue will be introduced with device_lock() in uevent_show() 
Date: Tue, 31 Dec 2024 15:56:08 +0800
Message-ID: <20241231075608.84009-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
References: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Hi, Dan, Greg,

We have found a potential tungtask issue has been introduce by commit 9a71892cbcdb ("Revert "driver core: Fix uevent_show() vs driver detach race""), which revert the rcu in device_uevent but reintroduce the device_lock() in uevent_show(). The reproduce procedure is quite simple:

$ lspci -n -s 0000:00:03.0
00:03.0 0108: 8086:5845 (rev 02)
$ echo 8086 5845 > /sys/bus/pci/drivers/vfio-pci/new_id
$ ls /dev/vfio
3  vfio
$ ./a.out &  (Binary program compiled with the following vfio demo program)
$ echo 1 > /sys/devices/pci0000:00/0000:00:03.0/remove

The root cause of the hung task is due to the device_lock() in uevent_show() is blocked by device_realease_driver() in pci remove routeine which is also blocked to wait for vfio_device->refcount == 0, which can never come because it's refcount has been lifted in the same user process.
Besides, the patch proposed by Dan [1] can not prevent hungtask from happening. For 6.13-rc5, in the following case:

ioctl(..,VFIO_GROUP_GET_DEVICE_FD,..)
        ...
        vfio_device_get_from_name()
        vfio_devcie->refcount -> 2
                                        pci_stop_and_remove_bus_device()
                                        pci_remove_bus()
                                        device_unregister()
                                        ...
                                        device_release_driver()
                                        device_lock()
                                        device_remove()
                                                vfio_unregister_group_dev()
                                                vfio_devcie_put()
                                                vfio_devcie->refcount -> 1
                                                wait_for(vfio_devcie->refcount = 0)
uevent_show()
        device_lock()

[1] https://lore.kernel.org/all/172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com/#R
                                                        
-------------------->8---------------------------------
int main(int argc, char *argv[])
{
        char buf[128];
        int container, group, device, uevent, ret;
        struct vfio_group_status group_status =
                                        { .argsz = sizeof(group_status) };
        struct vfio_iommu_type1_info iommu_info = { .argsz = sizeof(iommu_info) };

        container = open("/dev/vfio/vfio", O_RDWR);
        group = open("/dev/vfio/3", O_RDWR);
        ioctl(group, VFIO_GROUP_GET_STATUS, &group_status);
        ioctl(group, VFIO_GROUP_SET_CONTAINER, &container);
        ioctl(container, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU);
        ioctl(container, VFIO_IOMMU_GET_INFO, &iommu_info);
        device = ioctl(group, VFIO_GROUP_GET_DEVICE_FD, "0000:00:03.0");
        uevent = open("/sys/devices/pci0000:00/0000:00:03.0/uevent", O_RDWR);

        sleep(10);  /* Remove the pci device here */
        ret = read(uevent, buf, 128); /* We will get hung task here */
        printf("ret %d\n", ret);
        return 0;
}

Thanks,
Zekun
