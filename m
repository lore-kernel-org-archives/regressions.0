Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5D4403
	for <regressions@lists.linux.dev>; Thu,  1 Feb 2024 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706751585; cv=none; b=jh09mba7gGpooLfIdHuJbPAfKVcagsNpkAGyNy8x4oKFDKWFjO29n1gKkyYIC0708HZ6NNGEw7f8IBxImc6Fbp5SKjzBzU39rYIMcUX/0yWZmjZ/j0VpCAs/G3iEU/mfM2LuBHH7ZFNfUTEPiHN0ZNGxxKwZOd7lkUk/nETokMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706751585; c=relaxed/simple;
	bh=ghdzfng99LU1BtZDxRGUwLz3Ab6srNFDwYMsumD7pac=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RuippEhuA4UzL0HZQPfu48qtOss3waJV65/IpnY2FfUH7zB2qQm6aJMyxEnzuVtYS4gVj+C7oWiJds4ft902p6ealvn4LjAzyNeJywk9TD/KC/VFSqFT5nTYiWWIVAiWAOC0EmkcJ8S8/2oxJWhSTgLlWsCza+v2nMi5lj/oUoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TQM5c5s83z4f3lWG
	for <regressions@lists.linux.dev>; Thu,  1 Feb 2024 09:39:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 582321A016E
	for <regressions@lists.linux.dev>; Thu,  1 Feb 2024 09:39:39 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgCXaBFa9rplS99oCg--.9111S3;
	Thu, 01 Feb 2024 09:39:39 +0800 (CST)
Subject: Re: [REGRESSION] 6.7.1: md: raid5 hang and unresponsive system;
 successfully bisected
To: Blazej Kucman <blazej.kucman@linux.intel.com>, Song Liu <song@kernel.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, Dan Moulding <dan@danm.net>,
 carlos@fisica.ufpr.br, gregkh@linuxfoundation.org, junxiao.bi@oracle.com,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 "yukuai (C)" <yukuai3@huawei.com>
References: <ZbMnZnvyIyoWeIro@fisica.ufpr.br>
 <20240126154610.24755-1-dan@danm.net>
 <20240130172524.0000417b@linux.intel.com>
 <95f2e08e-2daf-e298-e696-42ebfa7b9bbf@huaweicloud.com>
 <CAPhsuW7QHq4e+cHvZcw8c=ePpeSM69UKTEi8P40=-jOZn+YyyA@mail.gmail.com>
 <20240131143640.00003296@linux.intel.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <3613d015-6664-88d2-4598-bce8f306371a@huaweicloud.com>
Date: Thu, 1 Feb 2024 09:39:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240131143640.00003296@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCXaBFa9rplS99oCg--.9111S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYg7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87
	Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi!

在 2024/01/31 21:36, Blazej Kucman 写道:
> Hi Kuai,
> 
> On my hardware issue also stopped reproducing with this fix.
> 
> I applied the fix on current HEAD of master
> branch in kernel/git/torvalds/linux.git repo.

That is great, thanks for testing!

Hi, Dan, can you try this patch as well. I feel this is a different
problem that the one you reported first. Because revert 0de40f76d567
shouldn't make any difference.

Thanks,
Kuai

