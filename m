Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6869DA933
	for <regressions@lists.linux.dev>; Sat,  4 Jan 2025 06:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735970586; cv=none; b=BFxWIMvIVebFfTo0kxACKeee+2KQY6+xU+cDOeenKW0n/XpYuxK83sGOASj3ZEJc3crmUh9x0nDRGgE+0haXhkWQqH2dyQa6Ncz10HYHpZPUlvMuObWrN9A0jVBz9znUTRmu6EqeazK/SoV1moQLGzR6j5SkasM5hFcJX737X2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735970586; c=relaxed/simple;
	bh=iWKMqPl9zhS9lLKpidAxrYHLtbqSTwOCsk5y1q9qXVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mQCT/5U3mF9pHJjlBIEV9MpB0q9G3cbsKlfNf00uBF28eAS82iS6GZYpRZfsEUpzzOnbHll1OervN9Ebc62Saoni5WIkx4PCTP7Dj/JcOVMIldzowP+8n0V5s2aZslYcbsxTkDzNj2Q3JjH46cSA9XDqkSjIzPlSZtmHvTNMMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YQ8tD3Qd3z1kxfb;
	Sat,  4 Jan 2025 14:00:04 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 59E3D14011D;
	Sat,  4 Jan 2025 14:03:00 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 4 Jan 2025 14:02:59 +0800
Message-ID: <7b599394-d1a1-4e13-9c5c-48321172ec65@huawei.com>
Date: Sat, 4 Jan 2025 14:02:54 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible hungtask issue will be introduced with device_lock() in
 uevent_show()
To: Greg KH <gregkh@linuxfoundation.org>
CC: <dan.j.williams@intel.com>, <linux-kernel@vger.kernel.org>,
	<rafael.j.wysocki@intel.com>, <regressions@lists.linux.dev>, <tj@kernel.org>,
	<alex.williamson@redhat.com>, <chenjun102@huawei.com>
References: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
 <20241231075608.84009-1-zhangzekun11@huawei.com>
 <2024123128-monetize-outtakes-3260@gregkh>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <2024123128-monetize-outtakes-3260@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2024/12/31 16:26, Greg KH 写道:
> On Tue, Dec 31, 2024 at 03:56:08PM +0800, Zhang Zekun wrote:
>> Hi, Dan, Greg,
>>
>> We have found a potential tungtask issue has been introduce by commit 9a71892cbcdb ("Revert "driver core: Fix uevent_show() vs driver detach race""), which revert the rcu in device_uevent but reintroduce the device_lock() in uevent_show(). The reproduce procedure is quite simple:
> 
> The revert just puts the original logic back in place, so this is not
> anything new that has been introduced, right?  It's just that the
> attempted fix didn't work, so a different fix needs to happen.
Hi, Greg,

Yes, there is nothing new introduced here. We have been testing the rcu 
fix (commit 15fffc6a5624 ("driver core: Fix uevent_show() vs driver 
detach race")) for monthes but has not obersved problems.

Noticing that, brmails+k write in bugzilla "Also, I can't say why the 
issue appeared in the past even without this commit being present, as I 
haven't bisected any kernel version before v6.6.45.". I doubt that there 
could still have problem described in bugzilla [1] even if commit 
c0a40097f0bc ("drivers: core: synchronize really_probe() and 
dev_uevent()") has been reverted, and the problem is not directly 
introduced by rcu in dev_uevent.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219244

Thanks,
Zekun
