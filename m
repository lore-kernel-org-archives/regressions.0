Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26BD312
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 10:33:44 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSba8-0001qa-HS; Thu, 16 Feb 2023 11:33:40 +0100
Message-ID: <eca2d453-5b0b-b012-dcf8-be6e197536db@leemhuis.info>
Date: Thu, 16 Feb 2023 11:33:40 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [Intel-wired-lan] [PATCH net v2] ice: avoid bonding causing
 auxiliary plug/unplug under RTNL lock
Content-Language: en-US, de-DE
To: Dave Ertman <david.m.ertman@intel.com>, intel-wired-lan@lists.osuosl.org
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230215191757.1826508-1-david.m.ertman@intel.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230215191757.1826508-1-david.m.ertman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676543625;9ba394cf;
X-HE-SMSGID: 1pSba8-0001qa-HS

On 15.02.23 20:17, Dave Ertman wrote:
> RDMA is not supported in ice on a PF that has been added to a bonded
> interface. To enforce this, when an interface enters a bond, we unplug
> the auxiliary device that supports RDMA functionality.  This unplug
> currently happens in the context of handling the netdev bonding event.
> This event is sent to the ice driver under RTNL context.  This is causing
> a deadlock where the RDMA driver is waiting for the RTNL lock to complete
> the removal.
> 
> Defer the unplugging/re-plugging of the auxiliary device to the service
> task so that it is not performed under the RTNL lock context.

Thanks for taking care of this.

> Reported-by: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
> Link: https://lore.kernel.org/linux-rdma/68b14b11-d0c7-65c9-4eeb-0487c95e395d@leemhuis.info/

FWIW, that should be

Link:
https://lore.kernel.org/netdev/CAK8fFZ6A_Gphw_3-QMGKEFQk=sfCw1Qmq0TVZK3rtAi7vb621A@mail.gmail.com/

instead, as that's Jaroslav's report

> Fixes: 5cb1ebdbc434 ("ice: Fix race condition during interface enslave")
> Fixes: 425c9bd06b7a ("RDMA/irdma: Report the correct link speed")
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> [...]

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
