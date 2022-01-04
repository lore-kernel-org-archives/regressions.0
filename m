Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07069168
	for <regressions@lists.linux.dev>; Tue,  4 Jan 2022 10:29:27 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n4h48-00046v-43; Tue, 04 Jan 2022 11:29:16 +0100
Message-ID: <f1ab176e-b899-8317-7811-86d26c6410de@leemhuis.info>
Date: Tue, 4 Jan 2022 11:29:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH rdma-rc] RDMA/mlx5: Fix dereg mr flow for kernel MRs
Content-Language: en-BS
To: Leon Romanovsky <leon@kernel.org>
Cc: Tony Lu <tonylu@linux.alibaba.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Alaa Hleihel <alaa@nvidia.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
References: <f298db4ec5fdf7a2d1d166ca2f66020fd9397e5c.1640079962.git.leonro@nvidia.com>
 <YcKSzszT/zw2ECjh@TonyMac-Alibaba> <YdLHDzmNXlqSMj/A@unreal>
 <0d897f0a-6671-bb78-21d5-e475d1db29b9@leemhuis.info>
 <YdM/0EUd3S4obWWa@unreal>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YdM/0EUd3S4obWWa@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1641292168;5edc849a;
X-HE-SMSGID: 1n4h48-00046v-43


On 03.01.22 19:26, Leon Romanovsky wrote:
> On Mon, Jan 03, 2022 at 02:15:59PM +0100, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> On 03.01.22 10:51, Leon Romanovsky wrote:
>>> On Wed, Dec 22, 2021 at 10:51:58AM +0800, Tony Lu wrote:
>>>> On Tue, Dec 21, 2021 at 11:46:41AM +0200, Leon Romanovsky wrote:
>>>>> From: Maor Gottlieb <maorg@nvidia.com>
>>>>>
>>>>> The cited commit moved umem into the union, hence
>>>>> umem could be accessed only for user MRs. Add udata check
>>>>> before access umem in the dereg flow.
>>>>>
>>>>> Fixes: f0ae4afe3d35 ("RDMA/mlx5: Fix releasing unallocated memory in dereg MR flow")
>>>>> Tested-by: Chuck Lever <chuck.lever@oracle.com>
>>>>> Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
>>>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>>>> ---
>>>>>  drivers/infiniband/hw/mlx5/mlx5_ib.h | 2 +-
>>>>>  drivers/infiniband/hw/mlx5/mr.c      | 4 ++--
>>>>>  drivers/infiniband/hw/mlx5/odp.c     | 4 ++--
>>>>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
>>>>
>>>> This patch was tested and works for me in our environment for SMC. It
>>>> wouldn't panic when release link and call ib_dereg_mr.
>>>>
>>>> Tested-by: Tony Lu <tonylu@linux.alibaba.com>
>>>
>>> Thanks, unfortunately, this patch is incomplete.
>>
>> Could you be a bit more verbose and give a status update? It's hard to
>> follow from the outside. But according to the "Fixes: f0ae4afe3d35"
>> above this was supposed to fix a regression introduced in v5.16-rc5 that
>> was also reported here:
>> https://lore.kernel.org/linux-rdma/9974ea8c-f1cb-aeb4-cf1b-19d37536894a@linux.alibaba.com/
> 
> The problematic commit f0ae4afe3d35 ("RDMA/mlx5: Fix releasing unallocated memory in dereg MR flow")
> should be reverted https://lore.kernel.org/all/20211222101312.1358616-1-maorg@nvidia.com
> and rewritten from the beginning.

Thx for the clarification. Is anyone tasked for sending the revert
upstream, to make sure the revert makes it into 5.16, which is due on
Sunday night?

And someone likely should ensure the change backported to 5.15.y as
e3bc4d4b50cae7db08e50dbe43f771c906e97701 is reverted as well. CCing a
few lists and Greg to make sure everyone is in the loop.

Ciao, Thorsten
