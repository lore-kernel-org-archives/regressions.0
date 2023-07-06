Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211518F74
	for <regressions@lists.linux.dev>; Thu,  6 Jul 2023 13:03:37 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qHOdu-0005Jn-7B; Thu, 06 Jul 2023 15:03:30 +0200
Message-ID: <62460153-04b1-b1aa-7966-45be16f3ec43@leemhuis.info>
Date: Thu, 6 Jul 2023 15:03:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/ast: report connection status on Display Port.
Content-Language: en-US, de-DE
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230706100102.563458-1-jfalempe@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230706100102.563458-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688648618;9ac961b6;
X-HE-SMSGID: 1qHOdu-0005Jn-7B

On 06.07.23 11:58, Jocelyn Falempe wrote:
> Aspeed always report the display port as "connected", because it
> doesn't set a .detect callback.
> Fix this by providing the proper detect callback for astdp and dp501.
> 
> This also fixes the following regression:
> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>  EDID on DP")
> The default resolution is now 640x480 when no monitor is connected.
> But Aspeed graphics is mostly used in servers, where no monitor
> is attached. This also affects the remote BMC resolution to 640x480,
> which is inconvenient, and breaks the anaconda installer.
> 
> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

So if this "also fixes a regression" how about a Fixes: tag and a CC:
<stable tag to ensure this is not only fixed in latest mainline, but
also in all affected stable and longterm kernels?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
